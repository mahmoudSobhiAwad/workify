import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_theme.dart';
import 'package:workify/shared/features/on_boarding/presentation/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: GetStartedPage()
    );
  }
}

