import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SeeAll({
    Key? key,
    required this.title,
    required this.colors,
    required this.onTap,
  }) : super(key: key);

  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18.sp, color: colors),
          ),
          TextButton(
              onPressed: onTap,
              child: Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ))
        ],
      ),
    );
  }
}
