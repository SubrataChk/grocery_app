import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/widget/quantity.dart';
import 'package:provider/provider.dart';

import '../global/colors.dart';
import '../provider/theme_provider.dart';

class ViewCard extends StatelessWidget {
  const ViewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {},
      child: Card(
          color: themeData.getDarkTheme ? Color(0xff153462) : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FancyShimmerImage(
                          height: 80.h,
                          width: 80.w,
                          imageUrl:
                              "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png"),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  color: color.getColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "\$125.78",
                            style: TextStyle(
                                color: color.getColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          )
                        ],
                      )
                    ],
                  ),
                  quantityController(
                      onTap: () {},
                      icons: CupertinoIcons.plus,
                      colors: Colors.green),
                ],
              ),
            ),
          )),
    );
  }
}
