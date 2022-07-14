import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cwiz/weather/cubit/quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DayQuotesPage extends StatefulWidget {
  const DayQuotesPage({Key? key}) : super(key: key);

  @override
  State<DayQuotesPage> createState() => _DayQuotesPageState();
}

class _DayQuotesPageState extends State<DayQuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
          top: 50,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 20.0, height: 100.0),
                const Text(
                  'Be',
                  style: TextStyle(
                      fontSize: 43.0, color: Colors.deepOrangeAccent),
                ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText('AWESOME'),
                      TyperAnimatedText('OPTIMISTIC'),
                      TyperAnimatedText('happy'.toUpperCase()),
                      TyperAnimatedText('Careful'.toUpperCase()),
                      TyperAnimatedText('Good'.toUpperCase()),
                      TyperAnimatedText('cleaver'.toUpperCase()),
                      TyperAnimatedText('nice'.toUpperCase()),
                      TyperAnimatedText('yourself'.toUpperCase()),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),

        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<QuoteCubit, String>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Text(state, style: GoogleFonts.habibi(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),);
              },
            ),
          ),
        )
      ],
    );;
  }
}
