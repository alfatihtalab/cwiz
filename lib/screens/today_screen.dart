import 'package:cwiz/components/today_summary_card.dart';
import 'package:cwiz/components/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          physics: const BouncingScrollPhysics(), children: [
        WeatherCard(),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text('Today', style: GoogleFonts.baloo(fontSize: 25),
          ),
        ),
        TodaySummary()
      ]),
    );
  }
}
