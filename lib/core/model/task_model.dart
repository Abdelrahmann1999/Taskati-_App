import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? note;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? startTime;
  @HiveField(5)
  String? endTime;
  @HiveField(6)
  int? color;
  @HiveField(7)
  bool? isComplete;

  TaskModel({
    this.id,
    this.title,
    this.note,
    this.startTime,
    this.endTime,
    this.date,
    this.color,
    this.isComplete,
  });

  TaskModel copywith({
    String? id,
    String? title,
    String? note,
    String? date,
    String? startTime,
    String? endTime,
    int? time,
    bool? isComplete,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
