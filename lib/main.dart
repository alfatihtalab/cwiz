import 'package:cwiz/app_manager/theme_manager.dart';
import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/screens/bootstrap_screen.dart';
import 'package:cwiz/screens/error_screen.dart';
import 'package:cwiz/screens/setting_screen.dart';
import 'package:cwiz/screens/splash_screen.dart';
import 'package:cwiz/services/location_service.dart';
import 'package:cwiz/storage/data_preference.dart';
import 'package:cwiz/storage/persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:location/location.dart';

late SharedPreferences preferences;
late SharedPreferencesPersistence persistence;
late WeatherManager weatherManager = WeatherManager();
late DataWeatherManger dataWeatherManger;
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  persistence = SharedPreferencesPersistence(preferences);


  // dataWeatherManger = DataWeatherManger(persistence);


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(CheckApp()));
}


class CheckApp extends StatefulWidget {
  const CheckApp({Key? key}) : super(key: key);

  @override
  _CheckAppState createState() => _CheckAppState();
}

class _CheckAppState extends State<CheckApp> {
  bool serviceEnabled = false;
  bool permissionEnabled = false;

  Future<bool> getData() async {
    try{
      await weatherManager.getLocationData();
      await weatherManager.getWeatherData();
      await weatherManager.getBulkData();
      return true;
    }
    catch(e){
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherManager>(
            create: (_) => WeatherManager()),
        ChangeNotifierProvider<ThemeManager>(
            create: (_) => ThemeManager(persistence))
      ],
      child: FutureBuilder(
        future: getData().timeout(Duration(seconds: 5)),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            switch(snapshot.data){
              case false : return MyApp(initRoute: "/error");
              case true : return MyApp();
            }
          } else if (snapshot.hasError) {
            return MyApp(initRoute: "/error");
          }

          // By default, show a loading spinner.
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            // home: Scaffold(
            //   body: SafeArea(child: Center(child: const CircularProgressIndicator(),)),),
          );
        },
      ),
    );
  }
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({this.initRoute = "/", Key? key}) : super(key: key);
  final String initRoute;

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
          '/error': (context) => ErrorPage(),
          //'/home_page_test': (context) => HomePageTest(),
        },
        initialRoute: initRoute,
      );
    });
  }
}
