import 'package:flutter/material.dart';

showerrordialogs(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
