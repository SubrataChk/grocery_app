import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';
import '../../widget/quantity.dart';

class CartWidgetSection extends StatefulWidget {
  const CartWidgetSection({super.key});

  @override
  State<CartWidgetSection> createState() => _CartWidgetSectionState();
}

class _CartWidgetSectionState extends State<CartWidgetSection> {
  TextEditingController _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: FancyShimmerImage(
                        imageUrl:
                            "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png",
                        height: 100.h,
                        width: 100.w,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: textColor),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          // height: 20.h,
                          child: Row(
                            children: [
                              quantityController(
                                  onTap: () {
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                                  _quantityTextController
                                                      .text) +
                                              1)
                                          .toString();
                                    });
                                  },
                                  icons: CupertinoIcons.plus,
                                  colors: Colors.green),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  _quantityTextController.text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: textColor,
                                      fontSize: 15.sp),
                                ),
                              ),
                              quantityController(
                                  onTap: () {
                                    if (_quantityTextController.text == "1") {
                                      return;
                                    } else {
                                      setState(() {
                                        _quantityTextController.text =
                                            (int.parse(_quantityTextController
                                                        .text) -
                                                    1)
                                                .toString();
                                      });
                                    }
                                  },
                                  icons: CupertinoIcons.minus,
                                  colors: Colors.red),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          CupertinoIcons.cart_badge_minus,
                          color: Colors.red,
                          size: 22.r,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Colors.green,
                          size: 22.r,
                        ),
                      ),
                    ),
                    Text(
                      "\$125.0",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
