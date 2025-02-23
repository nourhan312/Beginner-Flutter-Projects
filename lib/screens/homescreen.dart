import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_with_cubit/cubit/weather_cubit.dart';
import 'package:weather_with_cubit/cubit/weather_state.dart';
import 'package:weather_with_cubit/screens/error_screen.dart';
import 'package:weather_with_cubit/screens/no_weather.dart';
import 'package:weather_with_cubit/screens/searchscreen.dart';
import '../theme/Appcolors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    TextEditingController textController = TextEditingController();
    String text = '';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: AppColors.bgGradient,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.035),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.025),
                          child: TextFormField(
                            focusNode: focusNode,
                            controller: textController,
                            onChanged: (value) {
                              text = value;
                            },
                            cursorColor: AppColors.lightPurple,
                            decoration: InputDecoration(
                              fillColor: AppColors.lightPurple,
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.white,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  textController.clear();
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: AppColors.white,
                                ),
                              ),
                              hintText: 'Search....',
                              hintStyle: TextStyle(
                                color: AppColors.lightPurple,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.075),
                      ElevatedButton(
                        onPressed: () async {
                          focusNode.unfocus();
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeather(city: text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.017,
                              horizontal: screenWidth * 0.0375),
                          child: Text(
                            'Go',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherIntialState) {
                      return const NoWeather();
                    } else if (state is WeatherLoadingState) {
                      return Searchscreen(
                        weathermodel: state.weathermodel,
                      );
                    } else if (state is WeatherFailureState) {
                      return ErrorScreen(errorMessage: state.errorMessage);
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
