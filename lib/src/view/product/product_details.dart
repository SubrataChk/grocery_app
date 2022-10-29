import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';
import '../../widget/quantity.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: FancyShimmerImage(
                  boxFit: BoxFit.scaleDown,
                  width: double.infinity,
                  imageUrl:
                      "https://freepngimg.com/thumb/mango/9-2-mango-transparent.png")),
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r)),
                    color: Theme.of(context).cardColor),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Title",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: textColor),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$2.53",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp,
                                    color: textColor),
                              ),
                              Text("/kg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "\$5.53",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.blue),
                              alignment: Alignment.center,
                              child: Text(
                                "Free Delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: textColor),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        quantityController(
                            onTap: () {
                              setState(() {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) +
                                            1)
                                        .toString();
                              });
                            },
                            icons: CupertinoIcons.plus,
                            colors: Colors.green),
                        SizedBox(
                          width: 30.w,
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
                                fontSize: 20.sp,
                              ),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              decoration: InputDecoration(),
                            )),
                        SizedBox(
                          width: 30.w,
                        ),
                        quantityController(
                            onTap: () {
                              if (_quantityTextController.text == "1") {
                                return;
                              } else {
                                _quantityTextController.text =
                                    (int.parse(_quantityTextController.text) -
                                            1)
                                        .toString();
                              }
                            },
                            icons: CupertinoIcons.minus,
                            colors: Colors.red),
                      ],
                    ),
                  ],
                ),
              )),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$20.45/",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp),
                        ),
                        Text(
                          "${_quantityTextController.text}KG",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15.sp),
                        )
                      ],
                    )
                  ],
                )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
