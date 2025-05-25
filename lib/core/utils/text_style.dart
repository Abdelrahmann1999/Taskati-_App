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

  static getBodyTextStyle(
    BuildContext context, {
    double fontSize = 16,
    FontWeight fontweight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: "poppins",
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static getsmallTextStyle({Color color = AppColors.primaryColor}) {
    return TextStyle(
      fontFamily: "poppins",
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: AppColors.greyColor,
    );
  }
}
