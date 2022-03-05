import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app_dio/feature/model/weather_model.dart';

class DioService {
  Future<WeatherResponse?> getWeather(String city) async {
    try {
      String url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e9e3fda556af753166cb7a5c3f8895b7&units=metric";

      var response = await Dio().get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.toString());
        return WeatherResponse.fromJson(data);
      }
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
