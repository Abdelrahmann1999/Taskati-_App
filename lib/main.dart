import 'package:flutter/material.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/intro/splach_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "poppins",
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyles.getBodyTextStyle(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: splach_screen(),
    );
  }
}
