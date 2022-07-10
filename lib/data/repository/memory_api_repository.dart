
import 'package:flutter/material.dart';

import 'api_repository.dart';

class MemoryApiRepository extends ApiRepository{


  @override
  void close() {
    // TODO: implement close
  }



  @override
  Future init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> findCurrentWeatherData() {
    // TODO: implement findCurrentWeatherData
    throw UnimplementedError();
  }

  @override
  Future<void> findFiveWeatherForecast() {
    // TODO: implement findFiveWeatherForecast
    throw UnimplementedError();
  }
}
