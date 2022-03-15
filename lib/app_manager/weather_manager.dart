import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:cwiz/services/api/cwiz_services.dart';
import 'package:cwiz/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class WeatherManager extends ChangeNotifier {
  WeatherManager() {
    getLocationData();
    // getWeatherData();
    // getBulkData();
  }

  late ExploreWeather _exploreWeather;
  late WeatherBulkData _bulkData;
  late LocationData _locationData;

  ExploreWeather get exploreWeather => _exploreWeather;
  WeatherBulkData get bulkData => _bulkData;



  Future<void> getLocationData() async {
    var locationService = LocationService();
    await locationService.getLocationData();
    _locationData = locationService.locationData;
    notifyListeners();
  }

  //get explore weather
  Future<ExploreWeather> getWeatherData() async {
    _exploreWeather = await ApiBaseHelper.getExploreWeatherData(_locationData);

    return _exploreWeather;
  }

  //get current weather
  Future<WeatherBulkData> getBulkData() async {
    _bulkData = await ApiBaseHelper.getWeatherBulkData(_locationData);
    return _bulkData;
  }




  //get 7 days forcast

  //get feels like

}
