// import 'package:flutter/material.dart';
//
// class Sun extends StatefulWidget {
//   const Sun(
//       {Key key,
//       this.context,
//       this.margin,
//       this.maxWidth,
//       this.frontIcon,
//       this.backIcon,
//       this.frontColor,
//       this.backColor,
//       this.shadowColor,
//       this.frontIconSize,
//       this.backIconSize})
//       : super(key: key);
//
//   final BuildContext context;
//   final double margin;
//   final double maxWidth;
//   final IconData frontIcon;
//   final IconData backIcon;
//   final Color frontColor;
//   final Color backColor;
//   final Color shadowColor;
//   final double frontIconSize;
//   final double backIconSize;
//
//   @override
//   _SunState createState() => _SunState();
// }
//
// class _SunState extends State<Sun> {
//   get margin => null;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const _duration = Duration(milliseconds: 1000);
//     const _bigger = false;
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: margin),
//         constraints: BoxConstraints(
//           maxWidth: maxWidth,
//         ),
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               child: AnimatedOpacity(
//                 duration: _duration,
//                 opacity: 0.3,
//                 child: Icon(frontIcon,
//                     size: maxWidth / frontIconSize, color: shadowColor),
//               ),
//             ),
//             Positioned(
//               left: 1.0,
//               top: 2.0,
//               child: TweenAnimationBuilder(
//                 duration: Duration(seconds: 10),
//                 tween: Tween<double>(begin: 0, end: 2 * 3.14),
//                 builder: (_, double angle, __) {
//                   return Transform.rotate(
//                     angle: angle,
//                     child: Icon(backIcon,
//                         size: maxWidth / backIconSize, color: backColor),
//                   );
//                 },
//               ),
//             ),
//             Positioned(
//               left: 2.0,
//               top: 12.0,
//               child: AnimatedOpacity(
//                 duration: _duration,
//                 opacity: 0.8,
//                 child: Icon(frontIcon,
//                     size: maxWidth / frontIconSize, color: frontColor),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
