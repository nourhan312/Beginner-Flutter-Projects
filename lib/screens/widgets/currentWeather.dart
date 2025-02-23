import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../cubit/weatherAssets.dart';
import '../../models/weatherModel.dart';
import '../../theme/Appcolors.dart';

class CurrentWeather extends StatelessWidget {
  final weatherModel weathermodel;
  const CurrentWeather({
    super.key,
    required this.weathermodel,
  });

  @override
  Widget build(BuildContext context) {
    String condition = weathermodel.condition;
    if (kDebugMode) {
      print("Weather condition: $condition");
    }

    String imagePath = WeatherAssets.getImage(condition);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * 0.39,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(.15),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: -screenHeight * 0.09, // Adjusted based on screen height
          left: 20,
          child: SizedBox(
            width: screenWidth * 0.38, // Adjusted based on screen width
            height: screenWidth * 0.4, // Adjusted based on screen width
            child: Image.asset(imagePath),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.09, // Adjusted based on screen height
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: screenWidth * 0.2), // Adjusted spacing
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.07, // Adjusted based on screen width
                    vertical:
                        screenHeight * 0.01, // Adjusted based on screen height
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: screenWidth * 0.05, // Adjusted font size
                    ),
                  ),
                ),
                //      SizedBox(width: screenWidth * 0.03), // Adjusted spacing
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01, // Adjusted based on screen height
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: AppColors.lightRed,
                          size: screenWidth * 0.06, // Adjusted icon size
                        ),
                        SizedBox(width: screenWidth * 0.02), // Adjusted spacing
                        Text(
                          '${weathermodel.maxTemp.round()}º',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06, // Adjusted font size
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01), // Adjusted spacing
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: AppColors.lightPurple,
                          size: screenWidth * 0.06, // Adjusted icon size
                        ),
                        SizedBox(width: screenWidth * 0.02), // Adjusted spacing
                        Text(
                          '${weathermodel.minTemp.round()}º',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06, // Adjusted font size
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${weathermodel.currTemp.round()}º',
                  style: TextStyle(
                    fontSize: screenWidth * 0.24, // Adjusted font size
                    color: AppColors.white,
                  ),
                )
              ],
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white,
            ),
            SizedBox(
              height: screenHeight * 0.01, // Adjusted spacing
            ),
            Text(
              weathermodel.condition,
              style: TextStyle(
                color: AppColors.white,
                fontSize: screenWidth * 0.05, // Adjusted font size
              ),
            ),
          ],
        ),
      ],
    );
  }
}
