import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class GuestButtonSection extends StatelessWidget {
  final VoidCallback onTap;
  const GuestButtonSection({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.black38 : Colors.black;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: InkWell(
          onTap: onTap,
          child: Container(
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: themeData.getDarkTheme ? Colors.blue : Colors.black45),
            child: Text(
              "Continue as a guest",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: textColor),
            ),
          )),
    );
  }
}
