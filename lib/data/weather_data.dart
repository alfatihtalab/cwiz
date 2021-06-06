import 'package:flutter/cupertino.dart';

class WeatherData {
  final double temp;
  final double tempMin;
  final double tempMax;
  final String city;
  final String country;
  final String weatherState;
  final String description;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final double gust;
  WeatherData(
      {@required this.temp,
      @required this.tempMax,
      @required this.tempMin,
      @required this.pressure,
      @required this.humidity,
      @required this.windSpeed,
      @required this.windDeg,
      @required this.gust,
      @required this.country,
      @required this.city,
      @required this.weatherState,
      @required this.description});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        weatherState: json['weather'][0]['main'],
        city: json['name'],
        country: json['sys']['country'],
        temp: json['main']['temp'],
        tempMax: json['main']['temp_max'],
        tempMin: json['main']['temp_min'],
        description: json['weather'][0]['description'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        windDeg: json['wind']['deg'],
        gust: json['wind']['gust']);
  }
}
