import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

enum dialogType { error, warning, succes }

showmaindialog(
  BuildContext context,
  String message, {
  dialogType type = dialogType.succes,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:
          type == dialogType.error
              ? Colors.red
              : type == dialogType.warning
              ? AppColors.orangeColor
              : Colors.green,
      content: Text(
        message,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
