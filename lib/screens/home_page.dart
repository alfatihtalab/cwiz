import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var snapshot;

  @override
  void initState() {
    super.initState();
    snapshot = widget.snapshot;
  }

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    final kStyleInfo = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.country}, ${data.city} ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  '${data.temp.floor()} °C',
                  style: TextStyle(fontSize: 85, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    '${data.weatherState} \n ${data.description}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.blueAccent[100],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Min temp:${data.tempMin} °C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Max temp: ${data.tempMax} °C',
                    style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 8,
                ),
                Text('Pressure: ${data.pressure}' + ' hPa', style: kStyleInfo),
                SizedBox(
                  height: 8,
                ),
                Text('Humidity: ${data.humidity}' + ' g.kg -1',
                    style: kStyleInfo),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'Wind speed: ${data.windSpeed}' +
                        ' m/s,' +
                        '  Wind deg: ${data.windDeg} ',
                    style: kStyleInfo),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(18.0),
          child: RawMaterialButton(
            onPressed: () {
              setState(() {
                snapshot = widget.snapshot;
                data = snapshot.data;
              });
            },
            constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            shape: CircleBorder(),
            fillColor: Colors.blueAccent,
          ),
        ),
        Text('Refresh again')
      ],
    );
  }
}
