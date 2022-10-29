import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/widget/wishlist_widget.dart';
import 'package:provider/provider.dart';

import '../../app/app_image.dart';
import '../../global/colors.dart';
import '../../provider/theme_provider.dart';
import '../cart/cart_widget.dart';
import '../cart/empty_cart.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    bool _isEmpty = true;
    return _isEmpty
        ? EmptyCartWidget(
            warning: "Whoops!",
            buttonTitle: "Add a Wish",
            image: AppImage.empty_wishList,
            title:
                "You didn't have any wishlist yet! \nOrder something make us happy ",
            isAppBar: true)
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: textColor),
              toolbarHeight: 60.h,
              centerTitle: Platform.isAndroid ? true : false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                "Wishlist(3)",
                style: TextStyle(color: textColor, fontSize: 20.sp),
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
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    // mainAxisSpacing: 1.2,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    children: List.generate(10, (index) {
                      return WishListCard();
                    }),
                  )
                ],
              ),
            )),
          );
  }
}
