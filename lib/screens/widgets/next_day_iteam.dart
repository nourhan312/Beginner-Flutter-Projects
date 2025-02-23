import 'package:flutter/material.dart';
import 'package:weather_with_cubit/theme/Appcolors.dart';
import '../../cubit/weatherAssets.dart';

class NextDayItem extends StatelessWidget {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String weatherState;

  const NextDayItem({
    super.key,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = WeatherAssets.getImage(weatherState);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.025),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: AppColors.lightRed,
                      size: screenWidth * 0.04,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      '${maxTemp.round()}º',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: AppColors.lightPurple,
                      size: screenWidth * 0.04,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      '${minTemp.round()}º',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.025),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: screenWidth * 0.03, color: AppColors.white),
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ),
          Positioned(
            top: -screenHeight * 0.03,
            left: screenWidth * 0.04,
            child: SizedBox(
              height: screenHeight * 0.1,
              width: screenWidth * 0.2,
              child: Image.asset(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
