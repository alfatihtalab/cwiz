import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Hero(
        tag: 'splashScreen',
        child: Center(
          child: AspectRatio(
              aspectRatio: size.height * 0.25 / size.width * 0.25,
              child: Image(image: AssetImage('assets/logo/cwiz_logo.png'))),
        ),
      )),
    );
  }
}
