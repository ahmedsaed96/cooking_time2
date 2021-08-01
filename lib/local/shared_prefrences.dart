import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class MySharedPrefrences {
  static late SharedPreferences prefrences;
  static Future<SharedPreferences> init() async {
    return prefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveStringLocal({
    required String key,
    required String value,
  }) async {
    return prefrences.setString(key, value);
  }

  static String? getString({required String key}) {
    return prefrences.getString(key);
  }
}
/*
 static dynamic getAnyValue({required String key}) {
    return preferences!.get(key);
  }

  static String? getString({required String key}) {
    return preferences!.getString(key);
  }

  static bool? getbool({required String key}) {
    return preferences!.getBool(key);
  }

  static Future<bool> setAnyValue({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return preferences!.setBool(key, value);
    } else if (value is double) {
      return preferences!.setDouble(key, value);
    } else if (value is int) {
      return preferences!.setInt(key, value);
    }
    return preferences!.setString(key, value.toString());
  }

  static void deleteData(String key) {
    preferences!.remove(key);
  } */