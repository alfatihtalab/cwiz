import 'dart:core';
import 'dart:core';
import 'dart:math';

import 'package:cwiz/models/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/cloud_animiation.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key, required this.currentWeather})
      : super(key: key);
  final CurrentWeather currentWeather;

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  bool animated = true;

  void _changeContainerShape() {
    setState(() {
      animated = !animated;
    });
    print(animated);
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
          top: 100,
          left: 10,
          right: 10,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currentWeather.main!.temp!.round().toString(),
                      style: GoogleFonts.gupter(
                          fontSize: 120,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "°C",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  widget.currentWeather.weather!.first.main.toString() +
                      "\n" +
                      widget.currentWeather.weather!.first.description
                          .toString(),
                  style: GoogleFonts.gupter(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: Colors.deepOrange.shade700,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Today's summary",
                          style: GoogleFonts.gupter(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          primary: false,
                          children: [
                            TodayItemWidget(
                              name: "Temp",
                              degree:
                                  widget.currentWeather.main!.temp.toString() + "°C",
                              isAnimatedIcon: false,
                              iconData: Icons.thermostat,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TodayItemWidget(
                              name: "Feels like",
                              degree: widget.currentWeather.main!.feels_like
                                  .toString()+"°C",
                              isAnimatedIcon: false,
                              iconData: Icons.device_thermostat,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TodayItemWidget(
                              name: "Temp mini",
                              degree: widget.currentWeather.main!.temp_min
                                  .toString() +"°C",
                              isAnimatedIcon: true,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TodayItemWidget(
                              name: "Temp max",
                              degree: widget.currentWeather.main!.temp_max
                                  .toString() +"°C",
                              isAnimatedIcon: true,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TodayItemWidget(
                              name: "Pressure",
                              degree: widget.currentWeather.main!.pressure
                                  .toString() +"hPa",
                              isAnimatedIcon: true,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            TodayItemWidget(
                              name: "Humidity",
                              degree: widget.currentWeather.main!.humidity
                                  .toString() +"%",
                              isAnimatedIcon: true,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // Positioned(
        //     top: 300,
        //     left: 10,
        //     child: )
      ],
    );
  }

  Widget drawAnimation() {
    return animated
        ? DrawCloudSunAnimation(
            dayState: DayState.evening,
            sereenSize: MediaQuery.of(context).size,
          )
        : const SizedBox.shrink();
  }
}

class TodayItemWidget extends StatelessWidget {
  const TodayItemWidget({
    Key? key,
    required this.name,
    required this.degree,
    required this.isAnimatedIcon,
    this.iconData,
    this.iconColor,
  }) : super(key: key);

  final String name;
  final String degree;
  final bool isAnimatedIcon;
  final IconData? iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            isAnimatedIcon
                ? TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Transform.rotate(
                        angle: value,
                        child: Icon(
                          iconData ?? Icons.ac_unit_outlined,
                          color: iconColor ?? Color(0xff03989e),
                          size: 32,
                        ),
                      );
                    },
                    duration: Duration(seconds: 20),
                  )
                : Icon(
                    iconData ?? Icons.ac_unit_outlined,
                    color: iconColor ?? Color(0xff03989e),
                    size: 32,
                  ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: GoogleFonts.gudea(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        Text(
          degree,
          style: GoogleFonts.gupter(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
