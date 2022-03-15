//
//
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
//
//
//
// enum ConnectionStatus {
//   NotConnected, ErrorConnection, Connecting, Connected
// }
//
// class LocationManager extends ChangeNotifier {
//
//   LocationManager(this._location);
//
//   final Location _location;
//   late LocationData _locationData;
//
//   LocationData get locationData => _locationData;
//
//   //get locationData
//   Future<void> getLocationData() async {
//     _locationData = await _location.getLocation();
//   }
//
//   // Future<void> getPermission()async{
//
//
// }