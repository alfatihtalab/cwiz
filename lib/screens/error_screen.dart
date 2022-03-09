import 'package:cwiz/app_manager/weather_manager.dart';
import 'package:cwiz/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 3: Replace and add layout widgets
    // 1
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          // 2
          child: Center(
            // 3
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO 4: Add empty image
                // 1
                Flexible(
                  // 2
                  child: AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Icon(
                      Icons.wifi_off_outlined,
                      size: 82,
                    ),
                  ),
                ),

                // TODO 5: Add empty screen title
                const Text(
                  'No Connection',
                  style: TextStyle(fontSize: 21.0),
                ),

                // TODO 6: Add empty screen subtitle
                const SizedBox(height: 16.0),
                const Text(
                  'Check your connection or location services\n'
                  'Tap to try again',
                  textAlign: TextAlign.center,
                ),

                // TODO 7: Add browse recipes button
                MaterialButton(
                  textColor: Colors.white,
                  child: const Text('Try again'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.green,
                  onPressed: (){
                    // TODO 8: Go to Recipes Tab
                    // await Provider.of<WeatherManager>(context, listen: true)
                    //     .getWeatherData();
                    // weatherManager.getWeatherData();
                    // weatherManager.getBulkData();
                    // context.watch<WeatherManager>().getWeatherData();
                    // context.watch<WeatherManager>().getWeatherData();

                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
