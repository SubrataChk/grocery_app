import 'package:flutter/material.dart';
import 'package:grocery_app/src/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomColors {
  BuildContext context;
  CustomColors(
    this.context,
  );

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;
}
