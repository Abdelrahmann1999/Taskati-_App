import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class AppTheme {
  static get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
    ),

    fontFamily: "poppins",
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.primaryColor,
    ),
    timePickerTheme: TimePickerThemeData(backgroundColor: Colors.white),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getsmallTextStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );




  static get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.darkColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkColor,
    ),
    fontFamily: "poppins",
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.primaryColor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: const Color.fromARGB(255, 37, 36, 36),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
    ),
    inputDecorationTheme: InputDecorationTheme(
    
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
