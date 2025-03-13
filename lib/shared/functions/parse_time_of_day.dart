import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

TimeOfDay? parseTimeOfDay(String timeString) {
  DateFormat format = DateFormat("h:mm a"); // Format for "4:30 PM"
  DateTime? dateTime = format.tryParse(timeString);
  return dateTime != null
      ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
      : null;
}
