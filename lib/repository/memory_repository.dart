import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/repository/repository.dart';
import 'package:flutter/material.dart';

class MemoryRepository extends Repository with ChangeNotifier {

  final List<Daily> _daily = <Daily>[];
  

  @override
  void close() {
    // TODO: implement close
  }

  @override
  ExploreWeather findWeatherData() {
    // TODO: implement findWeatherData
    throw UnimplementedError();
  }

  @override
  Future init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
