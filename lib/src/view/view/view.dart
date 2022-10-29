import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/view/cart/empty_cart.dart';
import 'package:grocery_app/src/widget/view_widget.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';

class ViewPageSection extends StatelessWidget {
  const ViewPageSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    bool _isEmpty = true;
    return _isEmpty
        ? EmptyCartWidget(
            isAppBar: true,
            warning: "Oops!",
            buttonTitle: "See Now",
            image: AppImage.empty_history,
            title: "Your history is Empty!\n No products has been view yet!")
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: textColor),
              toolbarHeight: 60.h,
              centerTitle: Platform.isAndroid ? true : false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                "History",
                style: TextStyle(color: color.getColor, fontSize: 20.sp),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 22.r,
                    ))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ViewCard();
                        }))
              ],
            ),
          );
  }
}
