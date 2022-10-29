import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget quantityController(
    {required VoidCallback onTap,
    required IconData icons,
    required Color colors}) {
  return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Material(
          color: colors,
          borderRadius: BorderRadius.circular(12.r),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icons,
                size: 20.w,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ));
}
