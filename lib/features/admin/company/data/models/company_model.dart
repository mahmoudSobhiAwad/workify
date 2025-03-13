import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyModel {
  final String companyName;
  String? companyLogo;
  final LatLng? latLng;
  final String startTime;
  final String endTime;
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
    List<Timestamp> timestamps = List<Timestamp>.from(json["holidayDays"]);

    return CompanyModel(
        companyId: json['id'],
        latLng: json['location'] != null
            ? LatLng(json['location']['lat'], json['location']['long'])
            : null,
        companyLogo: json['companyLogo'],
        companyName: json['name'],
        startTime: (json['startTime']),
        endTime: (json['endTime']),
        holidayList: timestamps.map((ts) => ts.toDate()).toList());
  }
  Map<String, dynamic> toMap() {
    return {
      "location": {
        "lat": latLng?.latitude,
        "long": latLng?.longitude,
      },
      "id": companyId,
      "companyLogo": companyLogo,
      "name": companyName,
      "startTime": startTime,
      "endTime": endTime,
      "holidayDays":
          holidayList.map((time) => Timestamp.fromDate(time)).toList(),
    };
  }
}
