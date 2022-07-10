

import 'package:bloc/bloc.dart';
import 'package:cwiz/weather_bloc_observer.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  BlocOverrides.runZoned(
        () => runApp(const WeatherApp()),
    blocObserver: WeatherBlocObserver(),
  );
}
