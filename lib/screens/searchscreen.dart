import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_cubit/cubit/weather_cubit.dart';
import 'package:weather_with_cubit/models/weatherModel.dart';
import 'package:weather_with_cubit/screens/widgets/next_day_iteam.dart';
import 'package:weather_with_cubit/screens/widgets/currentWeather.dart';
import 'package:weather_with_cubit/theme/Appcolors.dart';

class Searchscreen extends StatelessWidget {
  final weatherModel weathermodel;
  const Searchscreen({super.key, required this.weathermodel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                weathermodel.city,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                weathermodel.country,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CurrentWeather(
              weathermodel: weathermodel,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Next days',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, index) {
                    final nextDay = weathermodel.allNext[index];

                    return NextDayItem(
                        date: nextDay.date,
                        maxTemp: nextDay.maxTemp,
                        minTemp: nextDay.minTemp,
                        weatherState: nextDay.weatherState);
                  },
                  itemCount: weathermodel.allNext.length),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary),
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context).clearWeather();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
                  child: Text(
                    'Clear',
                    style: TextStyle(color: AppColors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
