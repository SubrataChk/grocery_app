import 'package:flutter/cupertino.dart';
import 'package:grocery_app/src/service/theme_service.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePref darkThemePref = DarkThemePref();
  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePref.setDarkTheme(value);
    notifyListeners();
  }
}
