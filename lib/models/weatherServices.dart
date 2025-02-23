import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_with_cubit/models/weatherModel.dart';

class Weatherservices {
  final Dio dio;
  // http://api.weatherapi.com/v1/forecast.json?key=4eb890e965904105b9d45225241906&q=London&days=5
  String baseUrl = 'http://api.weatherapi.com/v1';
  String ApiKey = '4eb890e965904105b9d45225241906';
//http://api.weatherapi.com/v1/forecast.json?key=4eb890e965904105b9d45225241906&q=London&days=5&aqi=no&alerts=no
  Weatherservices(this.dio);

  Future<weatherModel> getWeather({required cityName}) async {
    try {
      var response = await Dio()
          .get('$baseUrl/forecast.json?key=$ApiKey&q=$cityName&days=5');
      weatherModel weathermodel = weatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'];
      log(e.toString());
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
