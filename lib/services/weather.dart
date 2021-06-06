import 'package:cwiz/data/weather_data.dart';
import 'package:cwiz/services/location.dart';
import 'package:cwiz/services/networking.dart';
import 'package:cwiz/utilties/constants.dart';

class WeatherMe {
  var lat;
  var lon;
  var uri;
  var weatherData;

  Future<WeatherData> getWetherData() async {
    LocationMe locationMe = LocationMe();
    await locationMe.getCurrentLocation();
    lat = locationMe.latitude;
    lon = locationMe.longitude;
    uri =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$app_id&units=metric';
    NetworkHelper networkHelper = NetworkHelper(uri: uri);
    weatherData = await networkHelper.fetchData();
    return weatherData;
  }
}
