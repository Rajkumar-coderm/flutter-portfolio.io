import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_portfolio/src/src.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: Responsive.isWeb(context)
            ? const Size(1920, 1080)
            : Responsive.isTablet(context)
                ? const Size(780, 900)
                : const Size(375, 745),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => GetMaterialApp(
          title: 'Rajkumar-Gahane',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Playfair Display',
            primaryColor: ColorsValue.color00ffda,
          ),
          home: const LandingHomePage(),
        ),
      );
}
