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
  const GoogleMapScreen({super.key});

  @override
  GoogleMapScreenState createState() => GoogleMapScreenState();
}

class GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  LatLng? _selectedPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    // Request location permission
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition();

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _selectedPosition = _currentPosition;
      });

      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    } else {
      CustomToast(
              context: context.mounted ? context : null,
              header: "Location Persmission Denied")
          .showBottomToast();
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
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomPushButton(
                onTap: () {
                  _selectedPosition != null
                      ? context.pop(_selectedPosition)
                      : null;
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
                            : null),
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
