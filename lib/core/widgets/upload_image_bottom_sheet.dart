import 'package:flutter/material.dart';
import 'package:taskati/core/widgets/mainbutton.dart';

showUploadBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mainbutton(
                title: "Upload From Camera",
                onpreesed: () {
                
                },
              ),
              SizedBox(height: 7),
              mainbutton(title: "Upload From Gallery", onpreesed: () {}),
            ],
          ),
        ),
      );
    },
  );
}
