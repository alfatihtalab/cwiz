// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'five_days_forcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FiveDayForcast _$$_FiveDayForcastFromJson(Map<String, dynamic> json) =>
    _$_FiveDayForcast(
      cod: json['cod'] as String,
      message: json['message'] as int,
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FiveDayForcastToJson(_$_FiveDayForcast instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'city': instance.city.toJson(),
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      id: json['id'] as int,
      name: json['name'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
      population: json['population'] as int,
      timezone: json['timezone'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord.toJson(),
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

_$_Coord _$$_CoordFromJson(Map<String, dynamic> json) => _$_Coord(
      lat: json['lat'] as int,
      lon: json['lon'] as int,
    );

Map<String, dynamic> _$$_CoordToJson(_$_Coord instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_ListElement _$$_ListElementFromJson(Map<String, dynamic> json) =>
    _$_ListElement(
      dt: json['dt'] as int,
      main: MainClass.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      pop: (json['pop'] as num).toDouble(),
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: DateTime.parse(json['dtTxt'] as String),
      rain: Rain.fromJson(json['rain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ListElementToJson(_$_ListElement instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds.toJson(),
      'wind': instance.wind.toJson(),
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys.toJson(),
      'dtTxt': instance.dtTxt.toIso8601String(),
      'rain': instance.rain.toJson(),
    };

_$_Clouds _$$_CloudsFromJson(Map<String, dynamic> json) => _$_Clouds(
      all: json['all'] as int,
    );

Map<String, dynamic> _$$_CloudsToJson(_$_Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

_$_MainClass _$$_MainClassFromJson(Map<String, dynamic> json) => _$_MainClass(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      tempMin: (json['tempMin'] as num).toDouble(),
      tempMax: (json['tempMax'] as num).toDouble(),
      pressure: json['pressure'] as int,
      seaLevel: json['seaLevel'] as int,
      grndLevel: json['grndLevel'] as int,
      humidity: json['humidity'] as int,
      tempKf: (json['tempKf'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MainClassToJson(_$_MainClass instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'seaLevel': instance.seaLevel,
      'grndLevel': instance.grndLevel,
      'humidity': instance.humidity,
      'tempKf': instance.tempKf,
    };

_$_Rain _$$_RainFromJson(Map<String, dynamic> json) => _$_Rain(
      the3H: (json['the3H'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RainToJson(_$_Rain instance) => <String, dynamic>{
      'the3H': instance.the3H,
    };

_$_Sys _$$_SysFromJson(Map<String, dynamic> json) => _$_Sys(
      pod: $enumDecode(_$PodEnumMap, json['pod']),
    );

Map<String, dynamic> _$$_SysToJson(_$_Sys instance) => <String, dynamic>{
      'pod': _$PodEnumMap[instance.pod],
    };

const _$PodEnumMap = {
  Pod.D: 'D',
  Pod.N: 'N',
};

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      id: json['id'] as int,
      main: $enumDecode(_$MainEnumEnumMap, json['main']),
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': _$MainEnumEnumMap[instance.main],
      'description': instance.description,
      'icon': instance.icon,
    };

const _$MainEnumEnumMap = {
  MainEnum.CLOUDS: 'CLOUDS',
  MainEnum.CLEAR: 'CLEAR',
  MainEnum.RAIN: 'RAIN',
};

_$_Wind _$$_WindFromJson(Map<String, dynamic> json) => _$_Wind(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'] as int,
      gust: (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WindToJson(_$_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
