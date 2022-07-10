// import 'dart:convert';
//
// import 'package:cwiz/storage/persistence.dart';
//
// class DataWeatherManger{
//   DataWeatherManger(this._persistence);
//
//   Duration _cacheValidDuration = Duration(minutes: 1);
//   DateTime _lastFetchTime = DateTime.fromMillisecondsSinceEpoch(0);
//   final SharedPreferencesPersistence _persistence;
//
//   //Save weather data of the day to storage
//   // update weather data after day of update
//
//   Future<void> saveWeatherData(WeatherBulkData weatherBulkData, DateTime dateTime) async {
//     if (_lastFetchTime.isBefore(DateTime.now().subtract(_cacheValidDuration))) {
//       final String todayWeather = weatherBulkData.toJson().toString();
//       //print(todayWeather);
//       _persistence.setStringKey("todayWeather", todayWeather);
//     }
//   }
//
//   //get wether data from storage
//   Future<WeatherBulkData> getWeatherData() async {
//     String? data = _persistence.getStringKey("todayWeather") as String;
//     print(data);
//       return WeatherBulkData.fromJson(jsonDecode(data));
//   }
//
// }
