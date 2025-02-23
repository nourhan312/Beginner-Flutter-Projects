import 'package:flutter/material.dart';

import '../theme/Appcolors.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset('assets/welcome.png'),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Write the name of a city to know the weather in that city!',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
