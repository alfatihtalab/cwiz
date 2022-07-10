// To parse this JSON data, do
//
//     final currentWeather = currentWeatherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

CurrentWeather currentWeatherFromJson(String str) => CurrentWeather.fromJson(json.decode(str));

String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

@freezed
class CurrentWeather with _$CurrentWeather {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeather({
    required Coord? coord,
    required List<Weather>? weather,
    required String? base,
    required Main? main,
    required int? visibility,
    required Wind? wind,
    required Clouds? clouds,
    required int? dt,
    required Sys? sys,
    required int? timezone,
    required int? id,
    required String? name,
    required int? cod,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    required int? all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double? lon,
    required double? lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    required double? temp,
    required double? feels_like,
    required double? temp_min,
    required double? temp_max,
    required int? pressure,
    required int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    required int? type,
    required int? id,
    required double? message,
    required String? country,
    required int? sunrise,
    required int? sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required int? id,
    required String? main,
    required String? description,
    required String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    required double? speed,
    required double? deg,
    required double? gust
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
