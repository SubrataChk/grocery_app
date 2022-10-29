import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class GoogleButtonSection extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleButtonSection({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  AppImage.google,
                  height: 40.h,
                  width: 40.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Sign in with Google",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
