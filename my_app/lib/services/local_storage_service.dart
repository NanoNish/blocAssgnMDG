import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static const String stateValueKey = 'state_value_key';

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is int) {
      _preferences.setInt(key, content);
    }
  }

  int get stateValue => _getFromDisk(stateValueKey);

  set stateValue(int number) {
    _saveToDisk(stateValueKey, number);
  }
}
