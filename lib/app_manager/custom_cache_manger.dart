//
// import 'dart:io';
//
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:path_provider/path_provider.dart';
//
// class CustomCacheManager {
//   static const key = 'bulk.json';
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
//   static CacheManager instance = CacheManager(
//     Config(
//       key,
//       stalePeriod: const Duration(days: 7),
//       maxNrOfCacheObjects: 20,
//       repo: JsonCacheInfoRepository(databaseName: key),
//       fileSystem:  ,
//       fileService: HttpFileService(),
//     ),
//   );
// }