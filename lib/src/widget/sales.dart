import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_image.dart';
import '../global/colors.dart';
import '../provider/theme_provider.dart';

class SalesSection extends StatelessWidget {
  const SalesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    final colors = CustomColors(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                          "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png",
                      height: 80.h,
                      width: 80.w,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        Text(
                          "1KG",
                          style: TextStyle(color: colors, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 20.w,
                                color: colors,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.heart,
                                size: 20.w,
                                color: colors,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "\$1.69",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: colors),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "\$3.69",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Product Title",
                  style: TextStyle(
                      color: colors,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
