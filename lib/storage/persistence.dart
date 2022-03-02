import 'package:shared_preferences/shared_preferences.dart';

abstract class Persistence {
  void setStringKey(String key, String value);
  void setIntKey(String key, int value);
  void setBoolKey(String key, bool value);
  String? getStringKey(String key);
  bool? getBoolKey(String key);
  void removeKey(String key);
}

class SharedPreferencesPersistence extends Persistence {
  SharedPreferencesPersistence(this._preferences);
  final SharedPreferences _preferences;
  @override
  String? getStringKey(String key) => _preferences.getString(key);

  @override
  void setStringKey(String key, String value) =>
      _preferences.setString(key, value);

  @override
  void setBoolKey(String key, bool value) => _preferences.setBool(key, value);

  @override
  void removeKey(String key) => _preferences.remove(key);

  @override
  void setIntKey(String key, int value) => _preferences.setInt(key, value);

  @override
  bool? getBoolKey(String key) {
    return _preferences.getBool(key);
  }

 
}
