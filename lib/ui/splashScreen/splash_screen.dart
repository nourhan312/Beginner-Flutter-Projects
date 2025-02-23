import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/core/utilis/app_assets.dart';
import 'package:news_app/core/utilis/app_colors.dart';
import '../../core/routes/page_route_names.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PagesRouteName.homeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Image.asset(
              AppAssets.splashMic,
            ),
          ),
        ],
      ),
    );
  }
}
