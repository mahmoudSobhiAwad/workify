import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(
            "Settings",
            style: AppFontStyle.bold23,
          ),
        ],
      ),
    ));
  }
}
