import 'package:cwiz/cwiz_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeelsLikeCard extends StatelessWidget {
  const FeelsLikeCard({Key? key,
    required this.dayTime,
    required this.temp}) : super(key: key);
  
  final String dayTime;
  final int temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      constraints: const BoxConstraints.expand(
        height: 150
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/dis_clouds.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.nights_stay,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  dayTime,
                  style: GoogleFonts.oldStandardTt(color: Colors.white,fontSize: 24),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 16,
            child: Text(
              "${temp.toString()} C",
              style:GoogleFonts.amarante(fontSize: 30, color: Colors.white) ,
            ),
          ),
        ],
      ),
    );
  }
}
