// import 'package:cwiz/screens/home_page_test.dart';
// import 'package:flutter/material.dart';
//
// class TestWidget extends StatefulWidget {
//   final AsyncSnapshot snapshot;
//
//   TestWidget({@required this.snapshot});
//
//   @override
//   _TestWidgetState createState() => _TestWidgetState();
// }
//
// class _TestWidgetState extends State<TestWidget> {
//   var snapshot;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     snapshot = widget.snapshot;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var data = snapshot.data;
//     return Scrollbar(
//       child: ListView(children: [
//         //stack the temp degree widget inside weather widget by making
//         //alignment original (0,0)
//         Stack(
//           alignment: const Alignment(0.0, 0.0),
//           children: [
//             //const Sun(),
//             Positioned(
//               child: CloudWidget(
//                 margin: margin,
//                 maxWidth: maxWidth,
//                 frontIcon: frontIcon,
//                 backIcon: backIcon,
//                 frontColor: frontIconColor,
//                 backColor: backIconColor,
//                 frontIconSize: frontIconSize,
//                 backIconSize: backIconSize,
//                 shadowColor: shadowIconColor,
//               ),
//             ),
//
//             Container(
//               child: Column(
//                 children: [
//                   Text('${data.dateTime}'),
//                   Text(
//                     '${data.temp.floor()} °C',
//                     style: TextStyle(fontSize: 50.0),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//                 top: maxWidth / 1.56,
//                 width: maxWidth,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             '${data.country}, ${data.city}',
//                             style: TextStyle(
//                                 fontSize: 24.0, fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text('test 1'),
//                         Text('test 2'),
//                         Text('test 3'),
//                       ],
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//         Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Text('data 1'),
//               Text('data 1'),
//               Text('data 1'),
//             ],
//           ),
//         )
//       ]),
//     );
//     ;
//   }
// }
