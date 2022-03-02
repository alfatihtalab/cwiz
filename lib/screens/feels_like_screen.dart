import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/components/feels_like_card.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeelsLikePage extends StatefulWidget {
  const FeelsLikePage({Key? key}) : super(key: key);

  @override
  _FeelsLikePageState createState() => _FeelsLikePageState();
}

class _FeelsLikePageState extends State<FeelsLikePage> {
  late List<Daily> dailyWeather;
  List feelLikes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // dailyWeather = context.watch<WeatherManager>().exploreWeather.daily!;
    //
    // dailyWeather.forEach((element) {
    //   print(element.feelsLike);
    // });
    // feelLikes.forEach((element) {print(element.day);});
    return ListView(
         controller: ScrollController(),
              children: [
                 FeelsLikeCard(dayTime: 'dayTime', temp: 55),
                 FeelsLikeCard(dayTime: 'dayTime', temp: 55),
                 FeelsLikeCard(dayTime: 'dayTime', temp: 55),
                 FeelsLikeCard(dayTime: 'dayTime', temp: 55),
               ],

       );
  }
}


