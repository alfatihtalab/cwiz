// // create a repository interface that will provide methods to read data from an api
//
// import 'package:cwiz/models/explore_weather.dart';

abstract class ApiRepository {
  //TODO ADD ALL FIND METHODS
  //Current weather data
  Future<void> findCurrentWeatherData();

  //5 day weather forecast
  Future<void> findFiveWeatherForecast();

  //TODO add all find methods from local storage


  //TODO add all update methods


  //TODO add save methods to local storage


  Future init();

  void close();
}
