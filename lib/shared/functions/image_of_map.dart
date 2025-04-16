import 'package:google_maps_flutter/google_maps_flutter.dart';

String getImageOfMap(LatLng latlang) {
  return "https://maps.googleapis.com/maps/api/staticmap?"
      "center=${latlang.latitude},${latlang.longitude}&zoom=15&size=600x300&maptype=roadmap"
      "&markers=color:red%7C${latlang.latitude},${latlang.longitude}&key=AIzaSyARJKYuZLAoUWO0M68tJLDrbUjAz57FaGA";
}
