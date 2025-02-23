import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_with_cubit/theme/Appcolors.dart';
import '../theme/Appcolors.dart';

class ErrorScreen extends StatelessWidget {
  final errorMessage;
  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Lottie.asset('assets/error-animation.json'),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Something went wrong...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  errorMessage,
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
