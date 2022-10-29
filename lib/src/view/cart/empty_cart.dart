import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/view/inner_screen/all_product.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';

class EmptyCartWidget extends StatelessWidget {
  final String title;
  final String warning;
  final String image;
  final bool isAppBar;
  final String buttonTitle;

  const EmptyCartWidget(
      {Key? key,
      required this.warning,
      required this.buttonTitle,
      required this.image,
      required this.title,
      required this.isAppBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    bool isEmpty = true;
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      appBar: isAppBar == true
          ? AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: textColor,
                  )),
            )
          : null,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Image.asset(image),
            ),
            Text(
              warning,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.sp, color: textColor),
              ),
            ),
            CustomButton(
              buttonTitle: buttonTitle,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllProductDetails()));
              },
            )
          ],
        )),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.buttonTitle, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    bool isEmpty = true;
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(12.r)),
          child: Text(
            buttonTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18.sp, color: textColor),
          ),
        ),
      ),
    );
  }
}
