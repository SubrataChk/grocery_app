import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class CustomListTiles extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? subTitle;
  final IconData leading;

  const CustomListTiles({
    Key? key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: ListTile(
        onTap: onTap,
        subtitle: Text(
          subTitle == null ? "" : subTitle!,
          style: TextStyle(
              color: themeData.getDarkTheme ? Colors.white : Colors.black),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: themeData.getDarkTheme ? Colors.white : Colors.black),
        ),
        leading: Icon(
          leading,
          size: 25.r,
          color: themeData.getDarkTheme ? Colors.white : Colors.black,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 22.r,
          color: themeData.getDarkTheme ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
