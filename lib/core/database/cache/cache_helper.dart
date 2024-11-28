import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! This method to Put data to local database
  Future<dynamic> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! This method to get data of string from chache
  String? getStringData({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! This method to get dynamic data
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Remove Specific data usig key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Clear all data from local database
  Future<bool> clearData({required String key}) async {
    return await sharedPreferences.clear();
  }

  Future<bool> checkData({required String key}) async {
    return sharedPreferences.containsKey(key);
  }
}
