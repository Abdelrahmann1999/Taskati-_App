
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/widgets/mainbutton.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

class todayHeader extends StatelessWidget {
  const todayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Spacer(),
        mainbutton(
          width: 135,
          title: "+ Add Task",
          onpreesed: () {
            pusshTo(context, AddTaskScreen());
          },
        ),
      ],
    );
  }
}
