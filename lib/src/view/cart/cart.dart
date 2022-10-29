import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/view/cart/cart_widget.dart';
import 'package:grocery_app/src/view/cart/empty_cart.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';

class CartPageSection extends StatelessWidget {
  const CartPageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    bool isEmpty = true;
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        appBar: isEmpty
            ? null
            : AppBar(
                toolbarHeight: 60.h,
                centerTitle: Platform.isAndroid ? true : false,
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  "Cart(3)",
                  style: TextStyle(color: textColor, fontSize: 20.sp),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        _cartDialog(context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 22.r,
                      ))
                ],
              ),
        body: isEmpty
            ? EmptyCartWidget(
                isAppBar: false,
                title: "Your cart is empty\n Add something and make me happy",
                warning: "Whoops!",
                buttonTitle: "Shop Now",
                image: AppImage.cart_empty,
              )
            : SafeArea(
                child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Text(
                              "Order Now",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textColor),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Total: ",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "\$125.5",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CartWidgetSection();
                        }),
                  )
                ],
              )));
  }

  _cartDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Clear Card",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
            content: Text("Your Card will be cleared"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }
}
