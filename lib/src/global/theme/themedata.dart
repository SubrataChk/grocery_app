import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData themeData(bool isDark, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDark ? Color(0xff00001a) : const Color(0xfffffffff),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDark ? Color(0xff1a1f3c) : const Color(0xfffffffff),
            ),
        cardColor: isDark ? Color(0xff0a0d2c) : const Color(0xfff2fdfd),
        canvasColor: isDark ? Color(0xff00001a) : Colors.grey[50],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDark ? const ColorScheme.dark() : ColorScheme.light()));
  }
}
