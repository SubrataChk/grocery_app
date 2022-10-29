import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';

import '../../widget/sales.dart';

class OnSalesSection extends StatelessWidget {
  const OnSalesSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _isEmpty = true;
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          "On Sales",
          style: TextStyle(
            color: color.getColor,
          ),
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.empty,
                        height: 200.h,
                        width: 200.w,
                      ),
                      Text(
                        "No products on sale yet!.\nStay tuned",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  )),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridView.count(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return SalesSection();
                    }),
                  )
                ],
              ),
            )),
    );
  }
}
