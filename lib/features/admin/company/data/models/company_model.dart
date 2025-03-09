import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyModel {
  final String companyName;
  final String? companyLogo;
  final LatLng? latLng;
  final DateTime startTime;
  final DateTime endTime;
  final List<DateTime> holidayList;
  final String companyId;

  CompanyModel(
      {required this.companyName,
      required this.companyId,
      this.companyLogo,
      this.latLng,
      required this.startTime,
      required this.endTime,
      required this.holidayList});
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        companyId: json['id'],
        companyName: json['name'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        holidayList: json['holidayDays']);
  }
}
