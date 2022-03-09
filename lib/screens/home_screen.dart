import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/components/feels_like_card.dart';
import 'package:cwiz/main.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:cwiz/screens/feels_like_screen.dart';
import 'package:cwiz/screens/forcast_screen.dart';
import 'package:cwiz/screens/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.exploreWeather, required this.bulkData})
      : super(key: key);
  final ExploreWeather exploreWeather;
  final WeatherBulkData bulkData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // late ExploreWeather exploreWeather;
  // late WeatherBulkData bulkData;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // exploreWeather = widget.exploreWeather;
    // bulkData = widget.bulkData;
    weatherManager.getWeatherData();
    weatherManager.getBulkData();
    super.initState();
  }

  static List<Widget> pages = [
    // TODO: Replace with Card1
    TodayPage(),
// TODO: Replace with Card2
    FeelsLikePage(),
// TODO: Replace with Card3
  ForcastPage()
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('CWIZ'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.all(0.0), child: pages[_selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              label: 'Feels Like',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined),
              label: 'Forcast',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );

  }
}
