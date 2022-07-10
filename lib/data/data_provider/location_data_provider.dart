

import 'package:location/location.dart';

class LocationDataProvider {
  Location location = new Location();

  Future<LocationData> getLocationData() async {

    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    LocationData _locationData;

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //
    //   }
    // }
    //
    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //
    //   }
    // }

    _locationData = await location.getLocation();
    return _locationData;
  }
}