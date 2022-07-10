//
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:cwiz/models/weather_bulk_data.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileCacheManger{
//   // String _fileBulkName = "bulk.json" ;
//   // String _fileWeatherName = "Weather.json";
//
//   //create the path
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     //print(directory.path);
//     return directory.path;
//   }
//
//   //create reference to the location
//   Future<File> get _localBulkFile async {
//     final path = await _localPath;
//     return File('$path/bulk.json');
//   }
//
//   Future<File> get _localWeatherFile async {
//     final path = await _localPath;
//     return File('$path/bulk.json');
//   }
//
//   //write to the file
//   Future<void> writeBulk(dynamic json) async {
//       final file = await _localBulkFile;
//       Map<String, dynamic> data = Map();
//       data.addAll({"bulk": json});
//     // Write the file
//       print(data['bulk']);
//     file.writeAsStringSync(jsonEncode(data));
//   }
//
//   Future<void> writeWeather(String json) async {
//       final file = await _localWeatherFile;
//     // Write the file
//     file.writeAsStringSync('$json');
//   }
//
//   //read form the file
//   Future<String> readBulk() async {
//     try {
//       final file = await _localBulkFile;
//
//       // Read the file
//       String testFile = await file.readAsString().whenComplete(() => print(this));
//       // print(testFile);
//       final Map contents = jsonDecode(file.readAsStringSync());
//       //Map valueMap = jsonDecode(contents);
//       print(contents);
//
//       return contents['bulk'];
//     } catch (e) {
//       // If encountering an error, return 0
//       throw "$e";
//     }
//   }
//
//   Future<String> readWeather() async {
//     try {
//       final file = await _localWeatherFile;
//
//       // Read the file
//       final contents = file.readAsStringSync();
//
//       return contents;
//     } catch (e) {
//       // If encountering an error, return 0
//       return 'no file';
//     }
//   }
//
//   Future<bool> checkFileExist(String fileName) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final path = directory.path;
//     final file = File('$path/$fileName');
//     bool result = file.existsSync();
//     return result;
//   }
// }