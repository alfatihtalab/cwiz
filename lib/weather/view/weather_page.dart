import 'package:cwiz/data/repository/weather_repository.dart';
import 'package:cwiz/weather/view/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';



/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class WeatherPage extends StatelessWidget {
  /// {@macro counter_page}
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(WeatherRepository()),
      child: WeatherView(),
    );
  }
}
