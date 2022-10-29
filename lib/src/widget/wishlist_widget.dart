import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/view/product/product_details.dart';
import 'package:provider/provider.dart';

import '../global/colors.dart';
import '../provider/theme_provider.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductDetails()));
          },
          child: Container(
            height: 200.h,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.5),
                border: Border.all(color: textColor, width: .5),
                borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              children: [
                Container(
                  height: 90.h,
                  width: 90.w,
                  margin: EdgeInsets.only(left: 3.w),
                  child: FancyShimmerImage(
                      imageUrl:
                          "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png"),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              color: textColor,
                              size: 20.w,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: textColor,
                              size: 20.w,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Flexible(
                          child: Text(
                        "Product",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: textColor,
                            fontSize: 15.sp),
                      )),
                      Text(
                        "\$2.59",
                        style: TextStyle(color: Colors.red, fontSize: 15.sp),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
