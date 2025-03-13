import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:workify/core/routing/app_router.dart';
import 'package:workify/core/utils/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates:context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "workify",
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
