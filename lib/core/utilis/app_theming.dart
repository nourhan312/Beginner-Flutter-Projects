import 'package:flutter/material.dart';
import 'package:news_app/core/utilis/app_styles.dart';
import 'app_colors.dart';
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
    appBarTheme:  const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium16Black,
      headlineMedium: AppStyles.medium25Black,
    )
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
    ),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium16White,
          headlineMedium: AppStyles.medium25White,
      )
  );
}
