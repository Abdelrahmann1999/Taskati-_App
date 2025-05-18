import "package:flutter/material.dart";
import "package:taskati/core/utils/colors.dart";

class TextStyles {
  static getTitleTextStyle({double fontsize = 30}) {
    return TextStyle(
      fontFamily: "poppins",
      fontSize: fontsize,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    );
  }

  static getBodyTextStyle() {
    return TextStyle(
      fontFamily: "poppins",
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: const Color.fromARGB(255, 126, 124, 124),
    );
  }

  static getsmallTextStyle() {
    return TextStyle(
      fontFamily: "poppins",
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: AppColors.blackColor,
    );
  }
}
