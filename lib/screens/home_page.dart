import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cwiz/models/weather_data.dart';
import 'package:cwiz/screens/weather_home_view_pager.dart';
import 'package:cwiz/weather/cubit/quote_cubit.dart';
import 'package:cwiz/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../weather/cubit/page_view_cubit.dart';
import '../widget/cloud_animiation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.weatherData}) : super(key: key);

  final WeatherData weatherData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentImg = "assets/backgrounds/day.png";
  DayState dayState = DayState.day;
  bool animated = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String aboutApp = " Cwiz gets current weather data for any location on Earth including over 200,000 cities! We collect and process weather data from different sources such as global and local weather models, just use your location and network services.";
  String appUsage = " By using this app you must confirm that and you are not allowed to break or hack the software polices!, such as third parties and using the same code snippets.\n   This app can access location and connection services, it can use third party to handle the api requests. Our privacy grantees to you that we do not use any personal info or data respect with your phone.";
  void _getCurrentBackground() {
    if (DateTime.now().hour < 12) {
      currentImg = "assets/backgrounds/morning.png";
      dayState = DayState.morning;
      animated = false;
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour < 18) {
      currentImg = "assets/backgrounds/day.png";
      dayState = DayState.evening;
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour < 16) {
      currentImg = "assets/backgrounds/evening.jpg";
      dayState = DayState.evening;
    } else if (DateTime.now().hour >= 16 && DateTime.now().hour < 19) {
      currentImg = "assets/backgrounds/evening2.jpg";
      dayState = DayState.night;
    } else if (DateTime.now().hour > 19 && DateTime.now().hour < 23) {
      currentImg = "assets/backgrounds/night.png";
      dayState = DayState.night;
    }
  }

  Widget drawAnimation() {
    return animated
        ? DrawCloudSunAnimation(
            dayState: DayState.evening,
            sereenSize: MediaQuery.of(context).size,
          )
        : const SizedBox.shrink();
  }

  @override
  void initState() {
    _getCurrentBackground();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(title: Text("Cwiz",style: Theme.of(context).textTheme.titleLarge,),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.light_mode))],),
      body: SafeArea(
          child: Stack(children: [
        drawAnimation(),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: Colors.black12.withAlpha(100).withOpacity(0.3),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 0.6,
                  image: AssetImage(currentImg)),
              color: Colors.black.withOpacity(0.6)),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black38,
        ),
        WeatherHomeViewPager(weatherData: widget.weatherData),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
              Row(
                children: [


                  BlocConsumer<PageViewCubit, int>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText(
                              widget.weatherData.currentWeather!.sys!.country
                                  .toString(),
                              textStyle: GoogleFonts.gudea(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              transitionHeight: 45),
                          RotateAnimatedText(
                              widget.weatherData.currentWeather!.name
                                  .toString(),
                              textStyle: GoogleFonts.gudea(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              transitionHeight: 45),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.deepOrange,
                  ),
                ],
              ),

            ],
          ),
        ),
      ])),
      drawer:  Drawer(
        backgroundColor: Color(0xff03989e).withOpacity(0.7),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.3),
                image: DecorationImage(
                  opacity: .4,fit:BoxFit.cover,
                    image: AssetImage("assets/icons/app_icon.png"))
              ),
              child: Text('Cwiz',style: GoogleFonts.gudea(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),),
            ),
            ExpansionTile(
              title: const Text('About the app', style: TextStyle(color: Colors.white),),
              children: [
                Padding(padding: EdgeInsets.all(8),
                  child: Text(aboutApp, style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                )
              ],
            ),
            ExpansionTile(
              title: const Text('Data and usage',  style: TextStyle(color: Colors.white),),
              children: [
                Padding(padding: EdgeInsets.all(8),
                  child: Text(appUsage, style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                )
              ],
            ),
            ExpansionTile(
              title: const Text('Contact us',  style: TextStyle(color: Colors.white),),
              children: [
                ListTile(
                  title: Text('Email us',   style: TextStyle(color: Colors.white),),
                  trailing: TextButton(
                    onPressed: _sendingMails,
                    child: Icon(Icons.email_rounded, color: Color(0xffff914d),),
                  ),
                ),

              ],

            ),
            Divider(),
            ListTile(
              title: const Text('Released version: 4.0.0',  style: TextStyle(color: Colors.white),),

            ),
          ],
        ),
      ),
      floatingActionButton: BlocConsumer<PageViewCubit, int>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state == 1) ...[
                FloatingActionButton.extended(
                  onPressed: () {
                    BlocProvider.of<PageViewCubit>(context)
                        .setCurrentPageIndex(0);
                  },
                  label: Row(
                    children: [
                      Icon(Icons.arrow_upward),
                      SizedBox(
                        width: 5,
                      ),
                      //
                      Text("Current"),
                    ],
                  ),
                  backgroundColor: Color(0xFFcc743d),
                ),
              ] else if (state == 2) ...[
                FloatingActionButton.extended(
                  onPressed: () {
                    BlocProvider.of<QuoteCubit>(context).getRandomQuote();
                  },
                  label: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 5,
                      ),
                      //
                      Text("Shuffle"),
                    ],
                  ),
                  backgroundColor: Color(0xFFcc743d),
                ),
              ] else
                ...[],
              SizedBox(
                width: 3,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<PageViewCubit>(context).changePageIndex();
                },
                label: Row(
                  children: [
                    if (state <= 1) ...[
                      Icon(Icons.arrow_downward),
                    ] else if (state == 2) ...[
                      Icon(Icons.arrow_upward),
                    ],
                    SizedBox(
                      width: 10,
                    ),
                    if (state == 0 || state == 2) ...[
                      Text("Forecast"),
                    ] else if (state == 1) ...[
                      Text("Quotes"),
                    ],
                  ],
                ),
                backgroundColor: Color(0xFFcc743d),
              ),
            ],
          );
        },
      ),
    );
  }

  _sendingMails() async {
    const url = 'mailto:alfatihtalab7@gmail.com';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }


}
