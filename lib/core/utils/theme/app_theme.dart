import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // fontFamily: AppStrings.englishFontFamily,
    // scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
    // primaryColor: AppColors.primary,
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: AppColors.primary,
    //   brightness: Brightness.dark,
    //   primary: AppColors.primary,
    //   onPrimary: Colors.white,
    //   secondary: AppColors.primary,
    //   onSecondary: Colors.white,
    //   surface: const Color(0xFF1E1E1E),
    //   onSurface: Colors.white,
    //   error: const Color(0xFFCF6679),
    //   onError: Colors.black,
    // ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all<Color>(Colors.grey),
      thumbColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
        //  buttonColor: AppColors.primary,
        ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      // focusColor: AppColors.primary,
      // floatingLabelStyle:
      //     const TextStyle(color: AppColors.primary, fontSize: 25),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          //color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          // color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: const Color(0xFF333333),
      filled: true,
      hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
      labelStyle: const TextStyle(color: Color(0xff9E9E9E)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        // backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black26),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //  backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF333333),
    ),
  );
}
