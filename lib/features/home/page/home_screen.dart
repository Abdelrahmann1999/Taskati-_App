import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task_list_builder.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              homeHeader(),
              SizedBox(height: 20),
              todayHeader(),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    width: 70,
                    height: 90,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primaryColor,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      //   setState(() {
                      //     _selectedValue = date;
                      //   });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              taskListBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
