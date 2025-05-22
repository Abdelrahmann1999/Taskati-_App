import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class taskListBuilder extends StatelessWidget {
  const taskListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FlutterTask -1",
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
                            "09: 00 AM",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        "FlutterTask -1",
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
                    "TODO",
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
        },
      ),
    );
  }
}
