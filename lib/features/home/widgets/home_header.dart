import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/profile.dart';

class homeHeader extends StatelessWidget {
  const homeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${LocalStorage.getData(LocalStorage.name)}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              "Have a nice day.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            pusshTo(context, profile());
          },
          child: CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(
              File(LocalStorage.getData(LocalStorage.image)),
            ),
          ),
        ),
      ],
    );
  }
}
