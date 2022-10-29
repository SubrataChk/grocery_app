import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/provider/theme_provider.dart';
import 'package:grocery_app/src/view/auth/sign_up.dart';
import 'package:grocery_app/src/view/forgot/forgot_pass.dart';
import 'package:grocery_app/src/widget/google_button.dart';
import 'package:grocery_app/src/widget/guest_button.dart';

import 'package:provider/provider.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text_form.dart';

class LoginPageSection extends StatefulWidget {
  const LoginPageSection({Key? key}) : super(key: key);

  @override
  State<LoginPageSection> createState() => _LoginPageSectionState();
}

class _LoginPageSectionState extends State<LoginPageSection> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _passFocuseNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool obsecure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _passFocuseNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print("This Form is valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: textColor),
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: textColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 15.sp),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Please enter a valid email address";
                        } else {
                          return null;
                        }
                      },
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_passFocuseNode),
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
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
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    child: TextFormField(
                      obscureText: obsecure,
                      controller: _password,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 15.sp),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return "Please enter a valid password";
                        } else {
                          return null;
                        }
                      },
                      onEditingComplete: () => {_submitFormOnLogin()},
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                obsecure = !obsecure;
                              });
                            },
                            child: Icon(obsecure
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
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
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordSection()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.sp),
                          )),
                    ),
                  )
                  // CustomTextFormField(
                  //   keyBoardType: TextInputType.emailAddress,
                  //   controller: _email,
                  //   validator: () {},
                  //   onEditingComplete: () =>
                  //       FocusScope.of(context).requestFocus(_passFocuseNode),
                  // ),
                  // CustomTextFormField(
                  //   keyBoardType: TextInputType.number,
                  //   controller: _password,
                  //   onEditingComplete: () {},
                  //   validator: (value) {
                  //     if (value!.isEmpty || !value.contains("@")) {
                  //       return "Please enter a valid email address";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
            CustomButton(
              colors: Colors.blue,
              onTap: () {},
              title: "Log In",
            ),
            GoogleButtonSection(onTap: () {}),
            Align(
              alignment: Alignment.center,
              child: Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
            ),
            GuestButtonSection(onTap: () {}),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: RichText(
                  text: TextSpan(
                      text: "Don\'t have a account? ",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                      children: [
                    TextSpan(
                        text: " Sign Up",
                        style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPageSection()));
                          }),
                  ])),
            )
          ],
        ),
      ),
    ));
  }
}
