import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/src/view/order/order.dart';
import 'package:grocery_app/src/view/view/view.dart';

import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../widget/custom_list_tiles.dart';
import '../wishList/wish_list.dart';

class ProfilePageSection extends StatefulWidget {
  const ProfilePageSection({
    super.key,
  });

  @override
  State<ProfilePageSection> createState() => _ProfilePageSectionState();
}

class _ProfilePageSectionState extends State<ProfilePageSection> {
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    var textColor = themeData.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        backgroundColor:
            themeData.getDarkTheme ? Color(0xff395144) : Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: themeData.getDarkTheme
                    ? Color(0xff395144)
                    : Color(0xff00ABB3),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Hi,",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                color: themeData.getDarkTheme
                                    ? Colors.cyan
                                    : Colors.grey[10],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " Subrata",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                )
                              ]),
                        ),
                        Text(
                          "subrata@gmail.com",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: themeData.getDarkTheme
                                  ? Colors.white
                                  : Colors.grey[10]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomListTiles(
              onTap: () async {
                await updateAddress(
                  context,
                );
              },
              subTitle: "Sub Title",
              title: "Address",
              leading: IconlyLight.location,
            ),
            CustomListTiles(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderPageSection()));
              },
              title: "Orders",
              leading: IconlyLight.activity,
            ),
            CustomListTiles(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishListScreen()));
              },
              title: "Wishlist",
              leading: Icons.favorite_border_outlined,
            ),
            CustomListTiles(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewPageSection()));
              },
              title: "View",
              leading: Icons.vpn_key_rounded,
            ),
            CustomListTiles(
              onTap: () {},
              title: "Forget Password",
              leading: Icons.key_sharp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Consumer<DarkThemeProvider>(
                  builder: (context, themeMode, child) {
                return SwitchListTile(
                    title: Text(
                      "Theme Data",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: themeMode.getDarkTheme
                              ? Colors.white
                              : Colors.black),
                    ),
                    value: themeMode.getDarkTheme,
                    secondary: Icon(
                      themeMode.getDarkTheme
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color:
                          themeMode.getDarkTheme ? Colors.white : Colors.black,
                      size: 25.r,
                    ),
                    onChanged: (bool value) {
                      themeMode.setDarkTheme = value;
                    });
              }),
            ),
            CustomListTiles(
              onTap: () async {
                await logOutDialoge();
              },
              title: "Log Out",
              leading: Icons.logout,
            ),
          ],
        ));
  }

  updateAddress(
    context,
  ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Update",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            content: TextFormField(
              controller: _addressController,
              maxLines: 5,
              decoration: InputDecoration(hintText: "Your Address"),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                  ))
            ],
          );
        });
  }

  Future logOutDialoge() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "Sign Out",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                )
              ],
            ),
            content: Text("Do you want to sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Yes",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                ),
              )
            ],
          );
        });
  }
}
