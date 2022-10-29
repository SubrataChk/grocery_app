import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/provider/theme_provider.dart';

import 'package:grocery_app/src/view/cart/cart.dart';
import 'package:grocery_app/src/view/categories/categories.dart';
import 'package:grocery_app/src/view/home/home.dart';
import 'package:grocery_app/src/view/profile/profile.dart';
import 'package:provider/provider.dart';

import '../../global/colors.dart';

class BottomBarSection extends StatefulWidget {
  BottomBarSection({Key? key}) : super(key: key);

  @override
  State<BottomBarSection> createState() => _BottomBarSectionState();
}

class _BottomBarSectionState extends State<BottomBarSection> {
  int _selectIndex = 0;
  final List _pages = [
    HomePageSection(),
    CategoriesPageSection(),
    const CartPageSection(),
    const ProfilePageSection()
  ];

  void _selectPages(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = CustomColors(context);
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor:
              themeData.getDarkTheme ? Colors.white : Colors.black,
          selectedItemColor:
              themeData.getDarkTheme ? Colors.white : Colors.black,
          currentIndex: _selectIndex,
          backgroundColor: themeData.getDarkTheme
              ? Theme.of(context).cardColor
              : Colors.white,
          onTap: _selectPages,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  _selectIndex == 0 ? IconlyBold.home : CupertinoIcons.home,
                  size: 25.r,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  _selectIndex == 1
                      ? IconlyBold.category
                      : IconlyLight.category,
                  size: 25.r,
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Badge(
                  position: BadgePosition.topEnd(top: -12, end: -7),
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  borderRadius: BorderRadius.circular(18.r),
                  badgeContent: Text(
                    "1",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  badgeColor: Colors.blue,
                  child: Icon(
                    _selectIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
                    size: 25.r,
                  ),
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  _selectIndex == 3
                      ? IconlyBold.profile
                      : CupertinoIcons.person,
                  size: 25.r,
                ),
                label: "Profile"),
          ]),
    );
  }
}
