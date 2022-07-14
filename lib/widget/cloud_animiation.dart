import 'dart:async';

import 'package:flutter/material.dart';

class DrawCloudSunAnimation extends StatefulWidget {
  const DrawCloudSunAnimation({Key? key, this.dayState, this.sereenSize, this.weatherStateA})
      : super(key: key);
  final DayState? dayState;
  final WeatherStateA? weatherStateA;
  final Size? sereenSize;

  @override
  _DrawCloudSunAnimationState createState() => _DrawCloudSunAnimationState();
}

class _DrawCloudSunAnimationState extends State<DrawCloudSunAnimation> {
  var weatherState;
  Map<String, IconData> icons = {
    'cloudy': Icons.cloud,
    'sunny': Icons.wb_sunny_rounded,
    'flash': Icons.flash_on,
    'sunny_sharp': Icons.wb_sunny_sharp,
    'hot': Icons.whatshot_rounded,
    'cloud_outlined': Icons.wb_cloudy_outlined,
    'circle': Icons.circle,
    'no_icon': Icons.villa
  };
  Icon? shadowIcon;
  Icon? intermediateIcon;
  Icon? frontIcon;

  var screenSize;
  bool? opacityCondition = false;
  double? shadowOpacityValue = 0.9;
  double? frontOpacityValue = 0.7;
  var maxHeight;
  var maxWidth;
  bool? centeredCloud = false;
  bool? centeredSun = false;

  void _showOpacity({bool? isAppear, double? shadow, double? frontShape}) {
    Timer(Duration(seconds: 4), () {
      setState(() {
        opacityCondition = isAppear;
        shadowOpacityValue = shadow;
        frontOpacityValue = frontShape;
      });
    });
  }

  void _moveCloud({bool? centered}) {
    Timer(Duration(seconds: 5), () {
      setState(() {
        centeredCloud = centered;
      });
    });
  }

  void _moveSunOrMoon({bool? centered}) {
    Timer(Duration(seconds: 2), () {
      setState(() {
        centeredSun = centered;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    weatherState = widget.dayState;
    screenSize = widget.sereenSize;
    maxHeight = screenSize.height;
    maxWidth = screenSize.width;
    switch (weatherState) {
      case DayState.night:
        //TODO 1 make clouds icons with moon or sun
        shadowIcon = Icon(Icons.cloud,
            size: maxWidth / 1.5, color: Colors.blueGrey[200]);
        frontIcon =
            Icon(Icons.cloud, size: maxWidth / 1.5, color: Colors.white);

        _showOpacity(isAppear: true, shadow: 1.0, frontShape: 0.7);
        _moveCloud(centered: true);
        _moveSunOrMoon(centered: true);
        //checking day time night or not
        if (DateTime.now().hour >= 18 && DateTime.now().hour < 5) {
          intermediateIcon = Icon(
            Icons.circle,
            size: maxWidth / 2.6,
            color: Colors.deepOrange[700],
          );
        } else {
          intermediateIcon = Icon(
            Icons.wb_sunny_rounded,
            size: maxWidth / 2.6,
            color: Colors.yellow[700],
          );
        }

        break;
      case DayState.evening:
        //TODO
        _showOpacity(isAppear: false, shadow: 0.0, frontShape: 0.0);
        _moveSunOrMoon(centered: true);

        if (DateTime.now().hour >= 18 && DateTime.now().hour <= 6) {
          intermediateIcon = Icon(
            Icons.circle,
            size: maxWidth / 1.47,
            color: Colors.orange[900],
          );
        } else {
          intermediateIcon = Icon(
            Icons.circle,
            size: maxWidth / 1.47,
            color: Colors.yellow[800],
          );
        }

        break;
      case 'RAIN':
        //TODO
        break;
      default:
        //TODO

        _showOpacity(isAppear: false, shadow: 0.0, frontShape: 0.0);
        _moveSunOrMoon(centered: true);
        if (DateTime.now().hour >= 19 && DateTime.now().hour <= 6) {
          intermediateIcon = Icon(
            Icons.circle,
            size: maxWidth / 1.5,
            color: Colors.orange[900],
          );
        } else {
          intermediateIcon = Icon(
            Icons.circle,
            size: maxWidth / 1.6,
            color: Colors.yellow[800],
          );
        }
    }
    super.initState();
  }

  //applying delay to change value
  _DrawCloudSunAnimationState() {
    //checking the weather statue
  }

  @override
  Widget build(BuildContext context) {
    //clouddy

    return Container(
      width: maxWidth,
      height: maxHeight,
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: (maxWidth * .3) / 2),
          constraints: BoxConstraints(
            maxWidth: 5,
          ),
          child: Stack(children: [
            Positioned(
              child: AnimatedOpacity(
                opacity: opacityCondition! ? shadowOpacityValue! : 0.0,
                duration: Duration(milliseconds: 1000),
                child: RadiantGradientMask(
                    child: shadowIcon,
                    colors: [Colors.grey[200], Colors.black12]),
              ),
            ),
            //intermediat Icon
            AnimatedPositioned(
              left: centeredSun! ? 20.0 : 40,
              top: centeredSun! ? 20.0 : 300,
              duration: Duration(seconds: 3),
              child: TweenAnimationBuilder(
                  duration: Duration(seconds: 12),
                  tween: Tween<double>(begin: 0, end: 2 * 3.14),
                  builder: (_, double angle, __) {
                    return Transform.rotate(
                        angle: angle, child: intermediateIcon);
                  }),
            ),
            AnimatedPositioned(
              left: 2.0,
              top: centeredCloud! ? 12.0 : 170,
              duration: Duration(seconds: 4),
              child: AnimatedOpacity(
                duration: Duration(seconds: 5),
                opacity: opacityCondition! ? frontOpacityValue! : 0.0,
                child: RadiantGradientMask(
                  child: frontIcon,
                  colors: [Colors.white, Colors.grey[700]],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child, this.colors});
  final Widget? child;
  final List<Color?>? colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.9,
        colors: colors as List<Color>,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}


enum DayState{
  morning, day, evening, night
}

enum WeatherStateA{
  CLOUDY, SUNNY, CLEAR, RAINY
}