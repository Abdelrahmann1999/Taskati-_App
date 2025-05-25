import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task_list_builder.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
                    height: 100,
                    DateTime.now(),

                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primaryColor,
                    selectedTextColor: Colors.white,

                    dateTextStyle: TextStyle(
                      color: const Color.fromARGB(255, 233, 4, 4),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),

                    dayTextStyle: TextStyle(
                      color: const Color.fromARGB(255, 233, 4, 4),
                      fontWeight: FontWeight.w600,
                    ),

                    monthTextStyle: TextStyle(
                      color: const Color.fromARGB(255, 233, 4, 4),
                      fontWeight: FontWeight.w600,
                    ),

                    onDateChange: (date) {
                      setState(() {
                        selectedDate = DateFormat("yyyy-mm-dd").format(date);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              taskListBuilder(selectedDate: selectedDate),
            ],
          ),
        ),
      ),
    );
  }
}
