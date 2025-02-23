import 'package:weather_with_cubit/models/weatherModel.dart';

class WeatherState {}

class WeatherIntialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {
  final weatherModel weathermodel;

  WeatherLoadingState(this.weathermodel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}
