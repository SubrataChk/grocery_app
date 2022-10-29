import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/global/colors.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  final VoidCallback onTap;
  const CategoriesWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: onTap,
      child: Card(
          color: themeData.getDarkTheme ? Color(0xff3C4048) : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    height: 100.h, width: 100.w, image: AssetImage(imagePath)),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: CustomColors(context).getColor),
                )
              ],
            ),
          )),
    );
  }
}
