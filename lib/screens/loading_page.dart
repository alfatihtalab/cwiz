import 'package:cwiz/screens/about_page.dart';
import 'package:cwiz/screens/home_page.dart';
import 'package:cwiz/services/weather.dart';
import 'package:flutter/material.dart';

WeatherMe weatherMe = WeatherMe();
var futureWeatherData;

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    futureWeatherData = weatherMe.getWetherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('CWIZ Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutPage();
                }));
              },
              icon: Icon(Icons.info))
        ],
      ),
      body: Center(child: buildFutureBuilder),
    );
  }

  FutureBuilder<dynamic> get buildFutureBuilder {
    return FutureBuilder(
        future: futureWeatherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: EdgeInsets.all(10.00),
                width: double.infinity,
                height: double.infinity,
                child: MyHomePage(
                  snapshot: snapshot,
                ));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pleas Check your network and location",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.redAccent)),
                      color: Colors.lightBlue,
                      onPressed: () {
                        setState(() {
                          retry();
                        });
                      },
                      child: Icon(Icons.refresh_outlined))
                ],
              ),
            );
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        });
  }

  void retry() {
    futureWeatherData = weatherMe.getWetherData();
    buildFutureBuilder;
  }
}
