import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/global/colors.dart';
import 'package:grocery_app/src/view/inner_screen/all_product.dart';
import 'package:grocery_app/src/view/inner_screen/on_sales.dart';
import 'package:grocery_app/src/view/product/product_details.dart';
import 'package:grocery_app/src/widget/product_card.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../widget/sales.dart';
import '../../widget/see_all.dart';

class HomePageSection extends StatelessWidget {
  HomePageSection({super.key});

  final List<String> offerImages = [
    AppImage.offer_one,
    AppImage.offer_two,
    AppImage.offer_three,
    AppImage.offer_four,
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    final colors = CustomColors(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colors),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        toolbarHeight: 50.h,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
          child: Text(
            "Grocery App",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.h,
              child: Swiper(
                autoplay: true,
                itemCount: offerImages.length,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                // control: SwiperControl(),
                itemBuilder: (context, index) {
                  return Image.asset(
                    offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnSalesSection()));
                },
                child: Text(
                  "Show All",
                  style: TextStyle(color: colors),
                )),
            SizedBox(
              height: 150.h,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "On Sales".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SalesSection();
                        }),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.h,
            ),
            SeeAll(
              title: "Our Product",
              colors: colors,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllProductDetails()));
              },
            ),
            Divider(
              thickness: 2.h,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return ProductCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails()));
                  },
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
