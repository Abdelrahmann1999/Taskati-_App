import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/mainbutton.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int SelectedColor = 0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var datecontroller = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();
  @override
  void initState() {
    super.initState();
    datecontroller.text = DateFormat.yMd().format(DateTime.now());
    startController.text = DateFormat("hh:mm a").format(DateTime.now());
    endController.text = DateFormat("hh:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: 25,
            ),
          ),
        ),

        title: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            "Add Task",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(),
              SizedBox(height: 5),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Title"),
              ),
              SizedBox(height: 10),
              Note(),
              SizedBox(height: 5),
              TextFormField(
                controller: noteController,
                maxLines: 3,
                decoration: InputDecoration(hintText: "Enter Description"),
              ),
              Date(),
              SizedBox(height: 5),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                  ).then((date) {
                    if (date != null) {
                      datecontroller.text = DateFormat(
                        "yyyy-mm-dd",
                      ).format(date);
                    }
                  });
                },

                controller: datecontroller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                  hintText: "20/12/2005",
                ),
              ),
              SizedBox(height: 10),
              Row(children: [StartTime(), SizedBox(width: 10), EndTime()]),
              SizedBox(height: 10),
              Color(),
              SizedBox(height: 5),
              Row(
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundColor:
                            index == 0
                                ? AppColors.primaryColor
                                : index == 1
                                ? AppColors.orangeColor
                                : AppColors.pinkColor,
                        child:
                            index == SelectedColor
                                ? Icon(Icons.check, color: AppColors.whiteColor)
                                : null,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: mainbutton(title: "Craete Task", onpreesed: () {}),
      ),
    );
  }

  Column Color() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Column Title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Column Note() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Note",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Column Date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Expanded StartTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Start Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 5),
          TextFormField(
            readOnly: true,
            onTap: () async {
              var pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                startController.text = pickedTime.format(context);
              }
            },
            controller: startController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.watch_later_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Expanded EndTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "End Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 5),
          TextFormField(
            readOnly: true,
            onTap: () async {
              var pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                endController.text = pickedTime.format(context);
              }
            },
            controller: endController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.watch_later_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
