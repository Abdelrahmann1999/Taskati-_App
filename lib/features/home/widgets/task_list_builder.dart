import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/task_card.dart';

class taskListBuilder extends StatelessWidget {
  const taskListBuilder({super.key, required this.selectedDate});
  
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalStorage.TasksBox.listenable(),
        builder: (context, box, child) {
          List<TaskModel> tasks = [];
          for (var task in box.values) {
            if (selectedDate == task.date) {
              tasks.add(task);
            }
          }
          if (tasks.isEmpty) {
            return Center(child: Lottie.asset(AppImages.emty, width: 300));
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: completeTaskUI(),
                secondaryBackground: deleteTaskUI(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    box.delete(tasks[index].id);
                  } else {
                    box.put(
                      tasks[index].id,
                      tasks[index].copywith(isComplete: true),
                    );
                  }
                },
                child: taskCard(taskModel: tasks[index]),
              );
            },
          );
        },
      ),
    );
  }

  Container completeTaskUI() {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.check, color: AppColors.whiteColor),
            SizedBox(width: 10),
            Text(
              "Complete Task",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container deleteTaskUI() {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Delete",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.delete, color: AppColors.whiteColor),
          ],
        ),
      ),
    );
  }
}
