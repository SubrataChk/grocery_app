import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_app/src/global/theme/themedata.dart';
import 'package:grocery_app/src/provider/theme_provider.dart';
import 'package:grocery_app/src/view/auth/login.dart';

import 'package:grocery_app/src/view/bottom/bottombar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.setDarkTheme =
        await darkThemeProvider.darkThemePref.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer<DarkThemeProvider>(
              builder: (context, darkTheme, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Grocery App',
              theme: CustomThemeData.themeData(darkTheme.getDarkTheme, context),
              home: LoginPageSection(),
            );
          });
        },
      ),
    );
  }
}
