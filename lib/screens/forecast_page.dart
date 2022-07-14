

import 'package:intl/intl.dart';
import 'package:cwiz/models/current_weather.dart';
import 'package:cwiz/models/five_days_forcast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/animated_forecast_card.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key, required this.fiveDaysForecast}) : super(key: key);
  final FiveDaysForecast fiveDaysForecast;

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  late FiveDaysForecast fiveDaysForecast;
  var dayFormat = DateFormat("yy-MM-dd hh:mm:ss aaa");
  var timeFormat = DateFormat("hh:mm aaa");

  @override
  void initState() {
    fiveDaysForecast = widget.fiveDaysForecast;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 73,),
          Text("Forecast: 5 days every 3 hours", style: GoogleFonts.gudea(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w700),),
          Expanded(
            // height: 400,
            // padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: fiveDaysForecast.list?.length,
                  itemBuilder: (context, index){
                  final currentDay = fiveDaysForecast.list![index];
                return AnimatedForcastCard(listElement: currentDay,);
              }),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
