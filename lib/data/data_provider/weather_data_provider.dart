import 'package:cwiz/models/current_weather.dart';
import 'package:cwiz/utilties/app_urls.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import '../../app_manager/app_exception.dart';
import '../../models/five_days_forcast.dart';
import '../../utilties/constants.dart';

class WeatherDataProvider {

  // final LocationData locationData;
  // WeatherDataProvider({required this.locationData});

  Future<CurrentWeather> readCurrentWeatherFromApi({required LocationData locationData}) async {
    // Read from DB or make network request etc...
    var url = Uri.parse(AppUrl.currentWeatherURL + "?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$app_id" + "&units=metric");

    late CurrentWeather currentWeather;
    var client = http.Client();
    try {
      var response = await client.get(
          url);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      final code = response.statusCode;
      print("here ${response.body}");
      // print("here ${decodedResponse}");
      // currentWeather = CurrentWeather.fromJson(decodedResponse!);
      print("second ${CurrentWeather.fromJson(decodedResponse)}");
      switch (response.statusCode) {
        case 200:
          // final currentWeather1 = currentWeatherFromJson(response.body);
          currentWeather = CurrentWeather.fromJson(convert.jsonDecode(response.body));
          print("second $currentWeather");

          // fileCacheManger.writeWeather(response.body);
          return currentWeather;
        case 400:
        case 401:
        case 403:
        case 500:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataExeption(response.body.toString());
      }
    }
    catch(e){
      print(e.toString());
      throw FetchDataExeption(e.toString());
    }finally{
      client.close();
    }
    // return currentWeather;
  }

  Future<FiveDaysForecast> readFiveDaysForecastFromApi({required LocationData locationData}) async {
    // Read from DB or make network request etc...
    var url = Uri.parse(AppUrl.fiveDaysForecastURL + "?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$app_id" + "&units=metric");

    late FiveDaysForecast fiveDaysForecast;
    var client = http.Client();
    try {
      var response = await client.get(
          url);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      final code = response.statusCode;
      // print("here ${response.body}");
      print("hereDecoded ${response.body}");
      // currentWeather = CurrentWeather.fromJson(decodedResponse!);
      // print("second ${CurrentWeather.fromJson(decodedResponse)}");
      switch (response.statusCode) {
        case 200:
        // final currentWeather1 = currentWeatherFromJson(response.body);
          fiveDaysForecast = FiveDaysForecast.fromJson(decodedResponse);
          // print("second $currentWeather");

          // fileCacheManger.writeWeather(response.body);
          return fiveDaysForecast;
        case 400:
        case 401:
        case 403:
        case 500:
          throw BadRequestException(response.body.toString());
        default:
          throw FetchDataExeption(response.body.toString());
      }
    }
    catch(e){
      print(e.toString());
      throw FetchDataExeption(e.toString());
    }finally{
      client.close();
    }


  }
}