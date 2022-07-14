import 'package:bloc/bloc.dart';
import 'package:cwiz/models/current_weather.dart';
import 'package:cwiz/models/weather_data.dart';
import 'package:cwiz/weather/weather.dart';
import 'package:meta/meta.dart';

import '../../data/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());


  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      await _weatherRepository.getAllWeatherData().then((value){
        emit(WeatherLoaded(value));
      });
    } on Exception {
      emit(WeatherFetchError());
    }
  }

  Future<void> refreshWeather() async {
      if (state is WeatherLoaded) return;
      try {

    } on Exception {
      // emit(state);
    }
  }

}
