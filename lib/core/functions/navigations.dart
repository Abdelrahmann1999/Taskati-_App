import 'package:flutter/material.dart';

pushTo(BuildContext context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
}
