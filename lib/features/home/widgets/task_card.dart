import 'package:flutter/material.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';

class taskCard extends StatelessWidget {
  const taskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color:
            taskModel.isComplete == true
                ? AppColors.greenColor
                : taskModel.color == 0
                ? AppColors.primaryColor
                : taskModel.color == 1
                ? AppColors.orangeColor
                : AppColors.pinkColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${taskModel.startTime} - ${taskModel.endTime}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  taskModel.note ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 80, color: Colors.grey),
          SizedBox(width: 12),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.isComplete == true ? "Completed" : "TODO",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
