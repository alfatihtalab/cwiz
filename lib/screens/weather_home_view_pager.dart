

import 'package:cwiz/models/weather_data.dart';
import 'package:cwiz/screens/current_weather_page.dart';
import 'package:cwiz/weather/cubit/page_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/current_weather.dart';
import 'day_quotes_page.dart';
import 'forecast_page.dart';

class WeatherHomeViewPager extends StatefulWidget {
  const WeatherHomeViewPager( {required this.weatherData, Key? key}) : super(key: key);
  final WeatherData weatherData;

  @override
  State<WeatherHomeViewPager> createState() => _WeatherHomeViewPagerState();
}

class _WeatherHomeViewPagerState extends State<WeatherHomeViewPager> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return BlocConsumer<PageViewCubit, int>(
        listener: (context, state) {
      // do stuff here based on BlocA's state
          controller.animateToPage(state,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut);
    },
    builder: (context, state) {
          return PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: controller,
          scrollDirection: Axis.vertical,
      onPageChanged: (value){
        print(value);
        BlocProvider.of<PageViewCubit>(context).setCurrentPageIndex(value);
      },
      children:  <Widget>[
        CurrentWeatherPage(currentWeather: widget.weatherData.currentWeather!),
      ForecastPage(fiveDaysForecast: widget.weatherData.fiveDaysForecast!,),

        DayQuotesPage(),
      ],
    );});
  }
}
