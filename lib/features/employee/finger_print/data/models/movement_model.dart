import 'package:cloud_firestore/cloud_firestore.dart';

class MovementModel {
  DateTime? checkIn;
  DateTime? checkOut;
  String? fullName;
  MovementModel({this.checkIn, this.checkOut, this.fullName});

  factory MovementModel.fromJson(Map<String, dynamic> json) {
    return MovementModel(
      checkIn: (json['checkIn'] != null
          ? (json['checkIn'] as Timestamp).toDate()
          : null),
      checkOut: (json['checkOut'] != null
          ? (json['checkOut'] as Timestamp).toDate()
          : null),
      fullName: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "checkIn":checkIn!=null? Timestamp.fromDate(checkIn!):null,
      "checkOut":checkOut!=null? Timestamp.fromDate(checkOut!):null,
      "name": fullName,
    };
  }
}
