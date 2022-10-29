import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';
import '../../provider/theme_provider.dart';
import '../../widget/product_card.dart';
import '../product/product_details.dart';

class AllProductDetails extends StatefulWidget {
  AllProductDetails({Key? key}) : super(key: key);

  @override
  State<AllProductDetails> createState() => _AllProductDetailsState();
}

class _AllProductDetailsState extends State<AllProductDetails> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchTextFocus = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchTextFocus.dispose();
    super.dispose();
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
        centerTitle: false,
        title: Text(
          "All Product",
          style: TextStyle(
            color: color.getColor,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  focusNode: _searchTextFocus,
                  controller: _searchController,
                  style: TextStyle(color: textColor, fontSize: 15.sp),
                  decoration: InputDecoration(
                      hintText: "What's in your mind!",
                      prefixIcon: Icon(
                        Icons.search,
                        color: textColor,
                      ),
                      suffix: IconButton(
                          onPressed: () {
                            _searchController.clear();
                            _searchTextFocus.unfocus();
                          },
                          icon: Icon(
                            Icons.close,
                            color: _searchTextFocus.hasFocus
                                ? Colors.red
                                : textColor,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      contentPadding: EdgeInsets.all(18.r)),
                ),
              ),
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
