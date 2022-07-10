import 'package:flutter/material.dart';

import '../components/rounded_image.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: SafeArea(
          child: Hero(
            tag: 'splashScreen',
            child: Center(
              child: AspectRatio(
                  aspectRatio: size.height * 0.30 / size.width * 0.30,
                  child: const CircleImage(imageProvider: AssetImage(
                    'assets/logo/cwiz_logo.png',), imageRadius: 70,)),
            ),
          )),
    );
  }
}

//
// class InitData extends StatefulWidget {
//   const InitData({Key? key}) : super(key: key);
//
//   @override
//   State<InitData> createState() => _InitDataState();
// }
//
// class _InitDataState extends State<InitData> {
//   late World world;
//
//   Future<World> getTheWorld()async{
//     world = await WafirLocationService().getTheWorld() as World;
//
//     return world;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: FutureBuilder(
//             future: getTheWorld(),
//             builder: (context, AsyncSnapshot<World> snapshot) {
//               if (snapshot.hasData) {
//                 return CheckCurrentState();
//               }
//               else if (snapshot.hasError) {
//                 return const ErrorPage();
//               }
//
//               return const SplashScreen();
//             }
//
//
//             ,
//           ),
//         ));
//   }
// }


