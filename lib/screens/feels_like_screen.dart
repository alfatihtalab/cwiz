import 'dart:math';

import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/components/feels_like_card.dart';
import 'package:cwiz/main.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/explore_weather.dart';
import '../models/feels_like_data.dart';

class FeelsLikePage extends StatefulWidget {
  const FeelsLikePage({Key? key}) : super(key: key);

  @override
  _FeelsLikePageState createState() => _FeelsLikePageState();
}

class _FeelsLikePageState extends State<FeelsLikePage> {
  late FeelsLike? feelsLike;
  late List<Daily> dailyData;
  List<double> feelsLikeListC = [];


  @override
  void initState() {
    // TODO: implement initState
    weatherManager.getWeatherData();
    getFeesLike();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var feelsLike = context.watch<WeatherManager>().exploreWeather.daily![0].feelsLike;

    var dailyWeather = context.watch<WeatherManager>().exploreWeather.daily!;
    // print(feelsLike.eve);
    feelsLikeListC.add(feelsLike?.day?? 0.0);
    feelsLikeListC.add(feelsLike?.morn?? 0.0);
    feelsLikeListC.add(feelsLike?.night?? 0.0);
    feelsLikeListC.add(feelsLike?.eve?? 0.0);

    // dailyWeather.forEach((element) {
    //   print(element.feelsLike?.day);
    // });
    // print(feelsLike?.day);
    return ListView(
      //shrinkWrap: true,
      controller: ScrollController(),
      // physics: const BouncingScrollPhysics(),
      children: [
    ListTile(
    title: Text('Today Feels Like', style: GoogleFonts.baloo(fontSize: 25),
    ),
    ),
        Container(
          child: ListView.separated(
            controller: ScrollController(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
             final dayTime = feelsLikeList[index];

             final random = Random().nextInt(3);
             final temp = feelsLikeListC[index] + random + 1;
             //print(temp);
             return FeelsLikeCard(dayTime: dayTime.dayTime, temp: temp, secondaryText: dayTime.secondaryText, quotes: dayTime.quotes[random],);
                }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1.0), itemCount:4,


       ),
        )]);
  }

  Future<void> getFeesLike() async {
    dailyData = weatherManager.exploreWeather.daily as List<Daily>;
    feelsLike = weatherManager.exploreWeather.daily![0].feelsLike;
  }
}


