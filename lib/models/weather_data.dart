

import 'package:cwiz/models/current_weather.dart';
import 'package:cwiz/models/five_days_forcast.dart';

class WeatherData {
  final CurrentWeather? currentWeather;
  final FiveDaysForecast? fiveDaysForecast;

  WeatherData({required this.currentWeather,
    required this.fiveDaysForecast});
}