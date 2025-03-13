import 'package:google_maps_flutter/google_maps_flutter.dart';

class LogingParamModel {
  final String companyId;
  final String userName;
  final String password;
  final LatLng? companyLocation;

  LogingParamModel({
    required this.companyId,
    required this.userName,
    required this.password,
    required this.companyLocation,
  });
}
