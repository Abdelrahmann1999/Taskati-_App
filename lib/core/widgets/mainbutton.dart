import 'package:flutter/material.dart';

class mainbutton extends StatelessWidget {
  const mainbutton({super.key, required this.title, required this.onpreesed});
  final String title;
  final Function() onpreesed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onpreesed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
