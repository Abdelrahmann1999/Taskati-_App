import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/features/intro/upload_screen.dart';

class splach_screen extends StatefulWidget {
  const splach_screen({super.key});

  @override
  State<splach_screen> createState() => _splach_screenState();
}

class _splach_screenState extends State<splach_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      pushTo(context, uploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logo, width: 500),

            Text("Taskati", style: TextStyles.getTitleTextStyle(fontsize: 25)),
            SizedBox(height: 20),
            Text(
              "it's time to get organized",
              style: TextStyles.getBodyTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
