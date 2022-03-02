import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:cwiz/services/api/cwiz_services.dart';
import 'package:cwiz/services/location.dart';
import 'package:flutter/material.dart';

class WeatherManager extends ChangeNotifier {
  WeatherManager(this.location) {
    getWeatherData();
    getBulkData();
  }

  late ExploreWeather _exploreWeather;
  late WeatherBulkData _bulkData;
  final Location location;

  ExploreWeather get exploreWeather => _exploreWeather;
  WeatherBulkData get bulkData => _bulkData;

  //get explore weather
  Future<ExploreWeather> getWeatherData() async {
    _exploreWeather = await ApiBaseHelper.getExploreWeatherData(location);

    return _exploreWeather;
  }

  //get current weather
  Future<WeatherBulkData> getBulkData() async {
    _bulkData = await ApiBaseHelper.getWeatherBulkData(location);
    return _bulkData;
  }

  //get 7 days forcast

  //get feels like

}
