import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsService {
  final SharedPreferences sharedPreferences;

  SharedPrefsService(this.sharedPreferences);

  T? get<T>(String key) {
    switch (T.runtimeType) {
      case String:
        return sharedPreferences.getString(key) as T?;
      case int:
        return sharedPreferences.getInt(key) as T?;
      case double:
        return sharedPreferences.getDouble(key) as T?;
      case bool:
        return sharedPreferences.getBool(key) as T?;
      case const (List<String>):
        return sharedPreferences.getStringList(key) as T?;
      default:
        return sharedPreferences.get(key) as T?;
    }
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  Future<bool> has(String key) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> set(String key, data) async {
    switch (data.runtimeType) {
      case String:
        return await sharedPreferences.setString(key, data);
      case int:
        return await sharedPreferences.setInt(key, data);
      case double:
        return await sharedPreferences.setDouble(key, data);
      case bool:
        return await sharedPreferences.setBool(key, data);
      case List:
        return await sharedPreferences.setStringList(key, data as List<String>);
      default:
        return await sharedPreferences.setString(key, data.toString());
    }
  }
}
