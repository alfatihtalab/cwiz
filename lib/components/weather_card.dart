import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/cwiz_themes.dart';
import 'package:cwiz/main.dart';
import 'package:cwiz/models/explore_weather.dart';
import 'package:cwiz/models/weather_bulk_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherCard extends StatefulWidget {
  //final Weather weather;

  const WeatherCard({
    Key? key,
  }) : super(key: key);

  //final WeatherBulkData weatherBulkData;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  bool touchedCard = false;

  List<Widget> createTagChips(WeatherBulkData weatherBulkData) {
    final chips = <Widget>[];

    final chip1 = Chip(
      label: Text(
        weatherBulkData.weather![0].main.toString(),
        style: CwizTheme.lightTextTheme.bodyText1,
      ),
      backgroundColor: Colors.cyanAccent.withOpacity(0.7),
    );
    final chip2 = Chip(
      label: Text(
        weatherBulkData.weather![0].description.toString(),
        style: CwizTheme.lightTextTheme.bodyText1,
      ),
      backgroundColor: Colors.cyan.withOpacity(0.8),
    );
    chips.addAll([chip1, chip2]);

    return chips;
  }

  late WeatherBulkData weatherBulkData;
  late ExploreWeather exploreWeather;
  late String imgAsset;
  bool imgIsLoaded = false;
  late Color color;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  //late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void dispose() {
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> initConnectivity() async {
    await getConnectivityResult();
    if (_connectionStatus == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      _updateConnectionStatus(_connectionStatus);
      imgIsLoaded = true;
      return imgIsLoaded;
    } else if (_connectionStatus == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      _updateConnectionStatus(_connectionStatus);
      imgIsLoaded = true;
      return imgIsLoaded;
    }
    else {
      imgIsLoaded = false;
      return imgIsLoaded;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> getConnectivityResult() async {
    _connectionStatus = await (Connectivity().checkConnectivity());
  }

  @override
  void initState() {
    // TODO: implement initState
    weatherBulkData = weatherManager.bulkData;
    exploreWeather = weatherManager.exploreWeather;
    imgAsset = getRandomBackground();
    color = getRandomColor();
    super.initState();
    initConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    // imgAsset = getRandomBackground();
    return InkWell(
      onTap: () {
        setState(() {
          touchedCard = !touchedCard;
          imgAsset = getRandomBackground();
          color = getRandomColor();
        });
      },
      child: Container(
        //margin: EdgeInsets.all(16.0),
        constraints: BoxConstraints.expand(
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          width: MediaQuery
              .of(context)
              .size
              .width,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage(imgAsset),
            // image: AssetImage("assets/backgrounds/dis_clouds.jpg"),
            image: NetworkImage(imgAsset),
            fit: BoxFit.cover,
          ),
          //color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                      weatherBulkData.sys!.country.toString() +
                          ", " +
                          weatherBulkData.name.toString(),
                      style: CwizTheme.darkTextTheme.headline2),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              right: 8,
              top: 16,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 2 * pi),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.rotate(
                    angle: value,
                    child: Icon(
                      Icons.wb_sunny,
                      color: Color.fromARGB(255, 255, 221, 100),
                      size: 32,
                    ),
                  );
                },
                duration: Duration(seconds: 20),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              bottom: touchedCard ? 8 : 2,
              right: touchedCard ? 8 : 2,
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  children: createTagChips(context
                      .watch<WeatherManager>()
                      .bulkData)),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherBulkData.main!.temp!.floor().toString(),
                    style: GoogleFonts.gudea(
                        fontSize: 90,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "°C",
                    style: GoogleFonts.gudea(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getRandomBackground() {
    dynamic clearImages = [
      "https://highdefwallpaper.com/wp-content/uploads/2017/06/clear-sky-hd-800x600.jpg",
      "https://iresizer.devops.arabiaweather.com/resize?url=https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/IMG-20201210-WA0008.jpg&size=850x478&force_jpg=1"

    ];
    dynamic listImages = [
      "https://wallpapercave.com/wp/wp4077236.jpg",
      "https://cdn.pixabay.com/photo/2020/05/06/15/15/background-5137941_960_720.jpg",
      "https://c4.wallpaperflare.com/wallpaper/585/194/405/pictures-of-nature-backgrounds-1920x1200-wallpaper-preview.jpg",
      "https://c4.wallpaperflare.com/wallpaper/123/670/530/laptop-backgrounds-nature-images-1920x1200-wallpaper-preview.jpg",
      "https://c4.wallpaperflare.com/wallpaper/87/851/622/laptop-backgrounds-nature-images-1920x1200-wallpaper-preview.jpg",
      "https://c4.wallpaperflare.com/wallpaper/803/675/618/background-nature-image-1920x1200-wallpaper-preview.jpg"
    ];
    dynamic cloudyImages = [
    "https://cdn.barnimages.com/wp-content/uploads/2018/04/20170710-barnimages-003-740x493.jpg",
      "https://c4.wallpaperflare.com/wallpaper/290/1022/455/laptop-backgrounds-nature-images-1920x1200-wallpaper-preview.jpg",
      "https://c4.wallpaperflare.com/wallpaper/121/684/1010/cool-background-photos-nature-scenes-1920x1200-wallpaper-preview.jpg",
      "https://www.journal-news.com/resizer/dJBHc8xtwG5PgqsNohLBOrU-HH8=/814x458/cloudfront-us-east-1.images.arcpublishing.com/coxohio/FDIJ2UYUQJHGFMJGER3FMGKMSE.jpg"

    ];
    dynamic rainyImages = [
    "https://images.unsplash.com/photo-1502635994848-2eb3b4a38201?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1528&q=80",
      "https://samitivej-prod-new-website.s3.ap-southeast-1.amazonaws.com/public/uploads/descriptions/1a2e1c368b9a82a61d68227e537c5c9a.jpg",
      "https://www.echolive.ie/cms_media/module_img/5602/2801274_1006_dashboardbig_rainonglassrainyweather-origin.jpg"
    ];
    dynamic otherImages = [
      "https://www.freepptbackgrounds.net/wp-content/uploads/2020/03/Gradient-colorful-backgrounds.jpg",
      "https://c4.wallpaperflare.com/wallpaper/612/498/569/cool-backgrounds-nature-1920x1200-wallpaper-preview.jpg",

    ];
    Random random = new Random();
    String image_name = listImages[random.nextInt(listImages.length)];
    switch (weatherBulkData.weather![0].main.toString().toLowerCase()) {
      case "clear":
        image_name = clearImages[random.nextInt(clearImages.length)];
        break;
      case "clouds":
        image_name = cloudyImages[random.nextInt(cloudyImages.length)];
        break;
      case "rain":
        image_name = rainyImages[random.nextInt(rainyImages.length)];
        break;
      case "snow":
        image_name = "https://images2.minutemediacdn.com/image/upload/c_fit,f_auto,fl_lossy,q_auto,w_728/v1555473019/shape/mentalfloss/520560-istock-613015246.jpg?itok=PGekk6Oc";
      break;
        default:
          image_name = otherImages[random.nextInt(otherImages.length)];

    }
  return image_name;
}

Color getRandomColor() {
  List<Color> colors = [
    Colors.blueGrey,
    Colors.purple.shade800,
    Colors.deepOrange.shade900.withOpacity(.6),
    Colors.indigo.shade800.withOpacity(.5),
    Colors.yellow.shade800
  ];
  Random random = new Random();
  Color color = colors[random.nextInt(colors.length)];
  //print(image_name);

  return color;
}}
