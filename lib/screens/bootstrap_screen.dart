import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/main.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:cwiz/screens/error_screen.dart';
import 'package:cwiz/screens/home_screen.dart';
import 'package:cwiz/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BootStrapPage extends StatefulWidget {
  const BootStrapPage({Key? key}) : super(key: key);

  @override
  _BootStrapPageState createState() => _BootStrapPageState();
}

class _BootStrapPageState extends State<BootStrapPage> {
  late ExploreWeather exploreWeather;
  late WeatherBulkData bulkData;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or a wifi network.
      return true;
    }  else {
      return false;
    }
  }

  Future<void> _updateConnectionStatus() async {

  }

  Future<bool> getData() async {
    //await Future.delayed(Duration(seconds: 5));
    //check connectivity
    bool checkConnectivity = await initConnectivity();
    if(checkConnectivity){
      try {
        await weatherManager.getWeatherData();
        await weatherManager.getBulkData();

        exploreWeather = weatherManager.exploreWeather;
        bulkData = weatherManager.bulkData;
        //here there's bug
        print('here 1');

        return true;
      } catch (e) {
        print('here 2');

        //print('error');
        return false;
      }
    }
    else{
      print('here 3');

      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //initConnectivity();
    // getData();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherManager>(builder: (context, manager, child) {
      manager.getWeatherData();
      manager.getBulkData();
      return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case true:
                 return HomePage(
                     exploreWeather: manager.exploreWeather, bulkData: manager.bulkData);
                //return Scaffold(appBar: AppBar(title: Text('ok'),),);
              case false:
              default:
                return ErrorPage();
            }
          } else if (snapshot.hasError) {
            return ErrorPage();
          }

          return SplashScreen();
        },
      );
    });
  }
}
