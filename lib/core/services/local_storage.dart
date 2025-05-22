import 'package:hive/hive.dart';

class LocalStorage {
  static late Box _box;
  
  static String name = "name";
  static String image = "image";

  static init() {
    _box = Hive.box("user");
  }

  static cacheData(String key, String value) {
    _box.put(key, value);
  }

  static getData(String key) {
    return _box.get(key);
  }
}
