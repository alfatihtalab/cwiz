import 'package:flutter/material.dart';

class ErrorConnectionPage extends StatelessWidget {
  const ErrorConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.wifi_off),
    );
  }
}
