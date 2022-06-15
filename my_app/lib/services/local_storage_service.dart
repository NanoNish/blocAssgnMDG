import 'package:shared_preferences/shared_preferences.dart';
import './apiservice.dart';

class LocalStorage {
  static late LocalStorage _instance;
  static late SharedPreferences _preferences;

  static const String stateValueKey = 'state_value_key';

  static Future<LocalStorage> getInstance() async {
    _instance = LocalStorage();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  static String getCount() {
    var data = _preferences.getString("initialNumber");
    return data ?? "0";
  }

  // static String getBin() {
  //   var data = _preferences.getString("initialNumber");
  //   return data ?? "0";
  // }

  static void setCount(String count) async {
    _preferences.setString("initialNumber", count);
  }

  // static void setBin(String count) async {
  //   var resp = await Binary().getData(count);
  //   _preferences.setString("Binary", resp);
  // }
}
