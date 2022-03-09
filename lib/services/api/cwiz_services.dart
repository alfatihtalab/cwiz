import 'dart:async';
import 'dart:convert';

import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:cwiz/services/app_exeption.dart';
import 'package:cwiz/services/location.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  static const url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=15.5466&lon=32.5336&exclude=hourly,minutely,&appid=4261f7bd50402a430c86a974023c8fbf&units=metric";

  final String _bulkUrl =
      "http://api.openweathermap.org/data/2.5/weather?lat=15.5466&lon=32.5336&appid=4261f7bd50402a430c86a974023c8fbf&units=metric";

  //TODO: get weather data

  static Future<ExploreWeather> getExploreWeatherData(Location location) async {
    late ExploreWeather exploreWeather;

    // FileCacheManger fileCacheManger = FileCacheManger();
    // bool isCached = await fileCacheManger.checkFileExist('weather.json');
    // print('weather $isCached');
    // if (isCached) {
    //   String encodedJson = await fileCacheManger.readWeather();
    //   //print(encodedJson);
    //   exploreWeather = ExploreWeather.fromJson(jsonDecode(encodedJson));
    //   return exploreWeather;
    // } else {
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely,&appid=4261f7bd50402a430c86a974023c8fbf&units=metric")).timeout(Duration(seconds: 9),onTimeout: (){
        throw BadRequestException("timeout");
      });
      switch (response.statusCode) {
        case 200:
          exploreWeather = ExploreWeather.fromJson(jsonDecode(response.body));
          // fileCacheManger.writeWeather(response.body);

          return exploreWeather;
        case 400:
        case 401:
        case 403:
        case 500:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataExeption(response.body.toString());
      }
  }

  static Future<WeatherBulkData> getWeatherBulkData(Location location) async {
    late WeatherBulkData weatherBulkData;
    // late HashMap<dynamic, dynamic> hashMapBulk;

    String url =
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=4261f7bd50402a430c86a974023c8fbf&units=metric";
    // FileCacheManger fileCacheManger = FileCacheManger();
    // Directory dir = await getTemporaryDirectory();
    // print(dir.path);

    // bool isCached = await fileCacheManger.checkFileExist('bulk.json');
    // print('bulk $isCached');
    // if (isCached) {
    //   String encodedJson = await fileCacheManger.readBulk();
    //   //print(encodedJson);
    //   //weatherBulkData = WeatherBulkData.fromJson(jsonDecode(encodedJson));
    //   //print(weatherBulkData);
    //   return WeatherBulkData.fromJson(jsonDecode(encodedJson));
    // } else {

    final response = await http.get(Uri.parse(url));
    switch (response.statusCode) {
      case 200:
        print(response.body.runtimeType);
        weatherBulkData = WeatherBulkData.fromJson(jsonDecode(response.body));
        // print(weatherBulkData.runtimeType);
        // Map<String, String> weatherBulkMap = Map();
        // weatherBulkMap.addAll({"bulk": response.body});
        // print(weatherBulkMap["bulk"]);

        // var jsonData = json.decode(response.body);
        //print(jsonData.toString());
        // await fileCacheManger.writeBulk(response.body);

        return weatherBulkData;
      case 400:
      case 401:
      case 403:
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataExeption(response.body.toString());
    }
  }
}
