import 'dart:math';

import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/main.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

TextStyle kSummeryStyle = GoogleFonts.acme(fontSize: 24);

class TodaySummary extends StatefulWidget {
  const TodaySummary({Key? key}) : super(key: key);

  @override
  _TodaySummaryState createState() => _TodaySummaryState();
}

class _TodaySummaryState extends State<TodaySummary> {
  late ExploreWeather exploreWeather;
  late WeatherBulkData weatherBulkData;
  //late String sunrise;
  var dayFormat = DateFormat("yy-MM-dd hh:mm:ss aaa");
  var timeFormat = DateFormat("hh:mm aaa");

  @override
  void initState() {
    // TODO: implement initState
    exploreWeather = weatherManager.exploreWeather;
    weatherBulkData = weatherManager.bulkData;
    //sunrise = DateTime.fromMicrosecondsSinceEpoch(exploreWeather.current!.sunset! * 1000000).hour + 2 as String ;
    //var strToDateTime = DateTime.parse(sunrise);
    //final convertLocal = strToDateTime.toLocal();
    //String updatedDt = newFormat.format(convertLocal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sunrise =  DateTime.fromMicrosecondsSinceEpoch(
        exploreWeather.current!.sunrise! * 1000000
    );var sunset =  DateTime.fromMicrosecondsSinceEpoch(
        exploreWeather.current!.sunset! * 1000000
    );
    var formatedSunrise = timeFormat.format(sunrise);
    var formatedSunset = timeFormat.format(sunset);
    print('time ' +
        "${formatedSunrise }");

    // print(context.watch<WeatherManager>().exploreWeather.daily![0].temp!.toString());
    print(dayFormat.format(DateTime.fromMicrosecondsSinceEpoch(context.watch<WeatherManager>().exploreWeather.daily![0].dt! * 1000000 )));
    // print(dayFormat.format(DateTime.fromMicrosecondsSinceEpoch(context.watch<WeatherManager>().bulkData.dt! * 10000 )));
    // print(context.watch<WeatherManager>().bulkData.dt);

    String? minimumTemp = context.watch<WeatherManager>().exploreWeather.daily![0].temp?.min.toString() ?? "No value";
    String? maximumTemp = context.watch<WeatherManager>().exploreWeather.daily![0].temp?.max.toString() ?? "No value";
    String? windSpeed = context.watch<WeatherManager>().exploreWeather.current?.windSpeed?.toString();
    String? windDeg = context.watch<WeatherManager>().exploreWeather.daily![0].windDeg?.toString();
    String? windGust = context.watch<WeatherManager>().exploreWeather.daily![0].windGust?.toString();


    return Container(
        // constraints: BoxConstraints.expand(
        //     height: MediaQuery.of(context).size.height ,
        //     width: MediaQuery.of(context).size.width,
        //     ),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
           color: Theme.of(context).cardColor,
          // image: DecorationImage(image:AssetImage("assets/backgrounds/cloud_blue_sky.jpg")),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        //color: Colors.blueGrey.shade200,
        child: ListView(
          // crossAxisCount: 3,
          // crossAxisSpacing: 8,
          // mainAxisSpacing: 8,
          primary: false,
          // 3
          physics: const NeverScrollableScrollPhysics(),
          // 4
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            buildListTaile("Min Temp",  "$minimumTemp °C" ,iconData: Icons.device_thermostat, isAnimated: false),
            buildListTaile("Max Temp", " $maximumTemp °C", iconData: Icons.device_thermostat, isAnimated: false),

            buildListTaile("Wind Speed", windSpeed ?? "Unavailable",),
            buildListTaile("Wind degree", windDeg ?? "Unavailable",),
            buildListTaile("Wind gust", windGust ?? "Unavailable",),
            buildListTaile("Pressure", "${exploreWeather.current!.pressure.toString()} hPa"),
            buildListTaile("Humidity", "${exploreWeather.current!.humidity.toString()} %",iconData: Icons.opacity, isAnimated: false),
            // buildListTaile("Clouds", exploreWeather.current!.sunrise.toString()),
            buildListTaile("Sunrise", formatedSunrise, iconData: Icons.wb_sunny_outlined ),
            buildListTaile("Sunset", formatedSunset, iconData: Icons.nights_stay, isAnimated: false  ),
            //buildListTaile("Humidity", exploreWeather.current!.humidity.toString()),
            //buildListTaile("Pressure", weatherBulkData.main!.pressure.toString()),



          ],
        ));
  }

  Widget buildListTaile(String title, String value,
      {IconData iconData = Icons.ac_unit , bool isAnimated = true}) {
    return ListTile(
      leading: isAnimated? TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 2 * pi),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.rotate(
            angle: value,
            child: Icon(
              iconData,
              //color: Color.fromARGB(255, 255, 221, 100),
              size: 32,
            ),
          );
        },
        duration: Duration(seconds: 20),
      ): Icon(
        iconData,
        //color: Color.fromARGB(255, 255, 221, 100),
        size: 32,
      ),
      title: Text(title, style: GoogleFonts.acme()),
      trailing: Text(value, style: GoogleFonts.aBeeZee(),),
    );
  }
}
