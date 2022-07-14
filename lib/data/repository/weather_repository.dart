import 'package:cwiz/data/data_provider/location_data_provider.dart';
import 'package:cwiz/data/data_provider/weather_data_provider.dart';
import 'package:cwiz/models/current_weather.dart';
import 'package:cwiz/models/five_days_forcast.dart';
import 'package:location/location.dart';

import '../../models/weather_data.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider = WeatherDataProvider();
  final LocationDataProvider locationDataProvider = LocationDataProvider();

  //getAllDataThatMeetsRequirements
  Future<WeatherData> getAllWeatherData() async {
    //TODO get location and inject it to current and forecast services
    try{
      final LocationData locationData = await locationDataProvider.getLocationData();
      final CurrentWeather currentWeather = await weatherDataProvider.readCurrentWeatherFromApi(locationData: locationData);
      final FiveDaysForecast fiveDaysForecast = await weatherDataProvider.readFiveDaysForecastFromApi(locationData: locationData);

      final WeatherData filteredData = WeatherData(
          currentWeather: currentWeather,
          fiveDaysForecast: fiveDaysForecast);
      return filteredData;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
