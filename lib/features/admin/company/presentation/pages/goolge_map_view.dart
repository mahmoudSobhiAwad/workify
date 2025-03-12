import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key, this.initialLocation});
  final LatLng? initialLocation;

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  LatLng? _selectedPosition;
  bool _isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    if (widget.initialLocation != null) {
      // If initialLocation is provided, use it
      setState(() {
        _currentPosition = widget.initialLocation;
        _selectedPosition = widget.initialLocation;
        _isLoading = false; // Stop loading
      });
    } else {
      // Otherwise, fetch the user's current location
      await _getUserLocation();
    }
  }

  Future<void> _getUserLocation() async {
    // Request location permission
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition();

        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
          _selectedPosition = _currentPosition;
          _isLoading = false; // Stop loading
        });

        _mapController
            ?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
      } catch (e) {
        // Handle errors (e.g., location services disabled)
        setState(() {
          _isLoading = false; // Stop loading
        });
        CustomToast(
          context: context.mounted ? context : null,
          header: "Error fetching location",
        ).showBottomToast();
      }
    } else {
      // Handle permission denial
      setState(() {
        _isLoading = false; // Stop loading
      });
      CustomToast(
        context: context.mounted ? context : null,
        header: "Location Permission Denied",
      ).showBottomToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Pick Location"),
      body: SafeArea(
        child: Stack(
          children: [
            // Google Map
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(), // Show loading indicator
              )
            else
              GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition ?? LatLng(30.033333, 31.233334),
                  zoom: 15,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                onTap: (LatLng position) {
                  setState(() {
                    _selectedPosition = position;
                  });
                },
                markers: _selectedPosition != null
                    ? {
                        Marker(
                          markerId: MarkerId("selected_location"),
                          position: _selectedPosition!,
                        )
                      }
                    : {},
              ),

            // Floating button at the bottom
            if (!_isLoading)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: CustomPushButton(
                  onTap: () {
                    if (_selectedPosition != null) {
                      context.pop(_selectedPosition);
                    }
                  },
                  backgroundColor: _selectedPosition == null
                      ? AppColors.grayE0
                      : AppColors.black50,
                  child: Center(
                    child: Text(
                      "Pick Location",
                      style: AppFontStyle.medium15.copyWith(
                        color: _selectedPosition == null
                            ? AppColors.scaffoldBackgroundColor
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
