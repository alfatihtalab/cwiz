// To parse this JSON data, do
//
//     final fiveDayForcast = fiveDayForcastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'five_days_forcast.freezed.dart';
part 'five_days_forcast.g.dart';

FiveDaysForecast fiveDaysForcastFromJson(String str) => FiveDaysForecast.fromJson(json.decode(str));

String fiveDaysForcastToJson(FiveDaysForecast data) => json.encode(data.toJson());

@freezed
class FiveDaysForecast with _$FiveDaysForecast {
  @JsonSerializable(explicitToJson: true)
  const factory FiveDaysForecast({
    required String cod,
    required int message,
    required int cnt,
    required List<ListElement> list,
    required City city,
  }) = _FiveDayForcast;

  factory FiveDaysForecast.fromJson(Map<String, dynamic> json) => _$FiveDaysForecastFromJson(json);
}

@freezed
class City with _$City {
  @JsonSerializable(explicitToJson: true)
  const factory City({
    required int id,
    required String name,
    required Coord coord,
    required String country,
    required int population,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required int lat,
    required int lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class ListElement with _$ListElement {
  @JsonSerializable(explicitToJson: true)
  const factory ListElement({
    required int dt,
    required MainClass main,
    required List<Weather> weather,
    required Clouds clouds,
    required Wind wind,
    required int visibility,
    required double pop,
    required Sys sys,
    required DateTime dtTxt,
    required Rain rain,
  }) = _ListElement;

  factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    required int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class MainClass with _$MainClass {
  const factory MainClass({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int seaLevel,
    required int grndLevel,
    required int humidity,
    required double tempKf,
  }) = _MainClass;

  factory MainClass.fromJson(Map<String, dynamic> json) => _$MainClassFromJson(json);
}

@freezed
class Rain with _$Rain {
  const factory Rain({
    required double the3H,
  }) = _Rain;

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@freezed
class Sys with _$Sys {
  @JsonSerializable(explicitToJson: true)
  const factory Sys({
    required Pod pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

enum Pod { D, N }

final podValues = EnumValues({
  "d": Pod.D,
  "n": Pod.N
});

@freezed
class Weather with _$Weather {
  @JsonSerializable(explicitToJson: true)
  const factory Weather({
    required int id,
    required MainEnum main,
    required String description,
    required String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

enum MainEnum { CLOUDS, CLEAR, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

@freezed
class Wind with _$Wind {
  const factory Wind({
    required double speed,
    required int deg,
    required double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

class EnumValues<T> {
  Map<String, T> map;
  // Map<T, String> reverseMap;

  EnumValues(this.map);

  // Map<T, String> get reverse {
  //   if (reverseMap == null) {
  //     reverseMap = map.map((k, v) => new MapEntry(v, k));
  //   }
  //   return reverseMap;
  // }
}
