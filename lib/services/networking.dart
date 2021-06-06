import 'dart:convert';

import 'package:cwiz/data/weather_data.dart';
import 'package:cwiz/services/location.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String uri;
  NetworkHelper({this.uri});
  LocationMe locationMe = LocationMe();

  Future<WeatherData> fetchData() async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
