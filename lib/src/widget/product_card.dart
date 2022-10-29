import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../global/colors.dart';
import '../provider/theme_provider.dart';

class ProductCard extends StatefulWidget {
  final VoidCallback onTap;
  ProductCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  TextEditingController _quantityTextController = TextEditingController();
  double price = 3.15;
  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FancyShimmerImage(
                  imageUrl:
                      "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png",
                  height: 80.h,
                  width: 80.w,
                  boxFit: BoxFit.fill,
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: textColor),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${(price * int.parse(_quantityTextController.text)).toStringAsFixed(2)}",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                            color: Colors.red),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            FittedBox(
                              child: Text("KG",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.sp,
                                  )),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _quantityTextController.text = "1";
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                  controller: _quantityTextController,
                                  key: const ValueKey("10"),
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  enabled: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                  decoration: InputDecoration(),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2.h),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12.r),
                                  bottomLeft: Radius.circular(12.r))))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
