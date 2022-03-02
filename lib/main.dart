import 'package:cwiz/app_manager/file_cache_manger.dart';
import 'package:cwiz/app_manager/theme_manager.dart';
import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/screens/bootstrap_screen.dart';
import 'package:cwiz/screens/setting_screen.dart';
import 'package:cwiz/services/location.dart';
import 'package:cwiz/storage/data_preference.dart';
import 'package:cwiz/storage/persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

late SharedPreferences preferences;
late SharedPreferencesPersistence persistence;
late Location location;
late WeatherManager weatherManager;
late DataWeatherManger dataWeatherManger;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  location = Location();
  await location.getCurrentLocation();
  preferences = await SharedPreferences.getInstance();
  persistence = SharedPreferencesPersistence(preferences);
  weatherManager = WeatherManager(location);
  dataWeatherManger = DataWeatherManger(persistence);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider<WeatherManager>(
                  create: (_) => WeatherManager(location)),
              ChangeNotifierProvider<ThemeManager>(
                  create: (_) => ThemeManager(persistence))
            ],
            child: MyApp(),
          )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //ThemeData? themeData;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder: (context, themeManager, child) {
      themeManager.getCurrentTheme();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CWIZ',
        theme: themeManager.themeMode,
        routes: {
          '/': (context) => BootStrapPage(),
          '/settings': (context) => SettingsPage(),
          '/bootstrap': (context) => BootStrapPage(),
          //'/home_page_test': (context) => HomePageTest(),
        },
      );
    });
  }
}
