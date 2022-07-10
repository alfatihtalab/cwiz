

import 'package:flutter/material.dart';

import 'weather/weather.dart';


/// A [MaterialApp] which sets the `home` to [WeatherPage].
/// {@endtemplate}
class WeatherApp extends MaterialApp {
  /// {@macro counter_app}
  const WeatherApp({Key? key}) : super(key: key, home: const WeatherPage());
}