import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function validator;
  final Function onEditingComplete;
  const CustomTextFormField(
      {Key? key,
      required this.keyBoardType,
      required this.validator,
      required this.controller,
      required this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: TextFormField(
        keyboardType: keyBoardType,
        style: TextStyle(fontSize: 15.sp),
        validator: validator(),
        onEditingComplete: onEditingComplete(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            contentPadding: EdgeInsets.all(20.r)),
      ),
    );
  }
}
