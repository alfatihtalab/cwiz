import 'package:cwiz/cwiz_themes.dart';
import 'package:cwiz/storage/persistence.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeManager(this._persistence);
  final SharedPreferencesPersistence _persistence;

  late ThemeData _theme;
  late bool? _isToggled;
  String _isDarkKey = "isDark";
  String _isToggledKey = "isToggled";

  //getter current theme mode
  // ignore: unnecessary_getters_setters
  ThemeData get themeMode => _theme;

  bool get isToggled => _isToggled ?? false;

  //setter current theme mode
  set themeMode(ThemeData mode) => _theme = mode;
  set isToggled(bool b) => _isToggled = b;

  Future<void> setDark(bool isDark) async {
    isDark ? _theme = CwizTheme.dark() : _theme = CwizTheme.light();
    _persistence.setBoolKey(_isDarkKey, isDark);
    _persistence.setBoolKey(_isToggledKey, isDark);
    notifyListeners();
  }

  void getToggeldValue(){
    _isToggled = _persistence.getBoolKey(_isToggledKey);
  }

  void getCurrentTheme() {
    bool? isDark = _persistence.getBoolKey(_isDarkKey);

    if (isDark == true) {
      _theme = CwizTheme.dark();
    } else {
      _theme = CwizTheme.light();
    }
  }
}
