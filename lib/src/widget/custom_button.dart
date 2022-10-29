import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color colors;
  const CustomButton(
      {Key? key,
      required this.colors,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: colors, borderRadius: BorderRadius.circular(12.r)),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
