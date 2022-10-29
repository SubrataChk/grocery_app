import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/view/cart/empty_cart.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';
import '../../widget/order_card.dart';

class OrderPageSection extends StatelessWidget {
  const OrderPageSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    bool _isEmpty = true;
    return _isEmpty
        ? EmptyCartWidget(
            warning: "Whoops!",
            buttonTitle: "Shop Now",
            image: AppImage.cart_empty,
            title:
                "You didn't place any order yet! \nOrder something make us happy ",
            isAppBar: true)
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: textColor),
              toolbarHeight: 60.h,
              centerTitle: Platform.isAndroid ? true : false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                "Your Orders(3)",
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
                          return OrderCard();
                        }))
              ],
            ),
          );
  }
}
