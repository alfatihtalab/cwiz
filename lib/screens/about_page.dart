import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CWIZ'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'About app:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'This is simple weather app get your current location and send'
                ' it as api-request form an open source, getting back with data of'
                ' temperatures in celsius and some info of weather.\n \n'
                'All rights reserved,, \n\n',
                style: TextStyle(fontSize: 18),
              ),
              Text('Developer contact:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              Text(
                  'Alfatih Abdelmutalib\n'
                  'e-mail: alfatihtalab7@gmail.com \n'
                  'phone: +249906078535',
                  style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
