part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {}


class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final WeatherData weatherData;

  const WeatherLoaded(this.weatherData);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherLoaded && other.weatherData == weatherData;
  }

  @override
  int get hashCode => weatherData.hashCode;
}

class WeatherFetchError extends WeatherState {
  const WeatherFetchError();
}
