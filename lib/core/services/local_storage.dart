import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class LocalStorage {
  static late Box userBox;
  static late Box<TaskModel> TasksBox;

  static String name = "name";
  static String image = "image";
  static String isDarkMode = "isDarkMode";

  static init() {
    userBox = Hive.box("user");
    TasksBox = Hive.box<TaskModel>("tasks");
  }

  // ********

  static cacheData( key,  value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

// *********


  static cachTask(String key, TaskModel valu) {
    TasksBox.put(key, valu);
  }

  static TaskModel? getTAsk(String key) {
    return TasksBox.get(key);
  }
}
