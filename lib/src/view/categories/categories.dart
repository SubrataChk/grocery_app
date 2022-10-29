import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_image.dart';
import 'package:grocery_app/src/global/colors.dart';
import 'package:grocery_app/src/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/categories.dart';

class CategoriesPageSection extends StatelessWidget {
  CategoriesPageSection({super.key});

  List<Map<String, dynamic>> catogoryInfo = [
    {
      "imagePath": AppImage.fruits,
      "title": "Fruits",
    },
    {
      "imagePath": AppImage.veg,
      "title": "Vegetables",
    },
    {
      "imagePath": AppImage.spinach,
      "title": "Herbs",
    },
    {
      "imagePath": AppImage.nuts,
      "title": "Nuts",
    },
    {
      "imagePath": AppImage.spices,
      "title": "Spices",
    },
    {
      "imagePath": AppImage.grains,
      "title": "Grains",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: false,
          title: Text(
            "Category",
            style: TextStyle(
              color: color.getColor,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: catogoryInfo.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return CategoriesWidget(
                      onTap: () {},
                      title: catogoryInfo[index]["title"],
                      imagePath: catogoryInfo[index]["imagePath"],
                    );
                  })
            ],
          ),
        )));
  }
}
