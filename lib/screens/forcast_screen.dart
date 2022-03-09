import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/components/forcast_animated_card.dart';
import 'package:cwiz/main.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ForcastPage extends StatefulWidget {
  const ForcastPage({Key? key}) : super(key: key);

  @override
  _ForcastPageState createState() => _ForcastPageState();
}

class _ForcastPageState extends State<ForcastPage> {
  // late Daily daily;
  late List<Daily> dailyData;
  var dayFormat = DateFormat.yMMMEd();

  @override
  void initState() {
    // TODO: implement initState
    weatherManager.getWeatherData();
    getForcast();
    super.initState();
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    // print(dailyData.length);
    // dailyData.forEach((element) {
    //   print(element.temp!.eve.toString());
    // });

    var dt = DateTime.fromMicrosecondsSinceEpoch(dailyData[1].dt! * 1000000);
    var formatedSunrise = dayFormat.format(dt);
    print('time ' + "${formatedSunrise}");

    return ListView(
      //shrinkWrap: true,
      controller: ScrollController(),
      // physics: const BouncingScrollPhysics(),
      children: [
        ListTile(
            title: Text('Seven Days Forecast', style: GoogleFonts.baloo(fontSize: 25),
            ),
        ),
        Container(
          child: ListView.separated(
            controller: ScrollController(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var dt = DateTime.fromMicrosecondsSinceEpoch(
                  dailyData[index].dt! * 1000000);
              final formatedDay = dayFormat.format(dt);
              return AnimatedForcastCard(
                  date: formatedDay, daily: dailyData[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: dailyData.length,
          ),
        ),
      ],
    );
  }

  Future<void> getForcast() async {
    dailyData = weatherManager.exploreWeather.daily as List<Daily>;
  }
}
