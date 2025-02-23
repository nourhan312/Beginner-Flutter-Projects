import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_with_cubit/cubit/weather_state.dart';
import 'package:weather_with_cubit/models/weatherModel.dart';

import '../models/weatherServices.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherIntialState());

  getWeather({required String city}) async {
    try {
      weatherModel weathermodel =
          await Weatherservices(Dio()).getWeather(cityName: city);
      emit(WeatherLoadingState(weathermodel));
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }

  void clearWeather() {
    emit(WeatherIntialState());
  }
}
