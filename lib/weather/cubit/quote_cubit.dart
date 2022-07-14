import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class QuoteCubit extends Cubit<String> {
  QuoteCubit() : super("");

   List<String> randomQuotes = [
    "Morning is wonderful. Its only drawback is that it comes at such an inconvenient time of day.",
    "Morning is an important time of day, because how you spend your morning can often tell you what kind of day you are going to have.",
    "I love the smell of book ink in the morning.",
    "Planning in the morning",
    "It's very beautiful over there. I don\'t know where there is, but I believe it\'s somewhere, and I hope it\'s beautiful.""Learn from yesterday, live for today, hope for tomorrow",
    "Learn from yesterday, live for today, hope for tomorrow",
    "If you fell down yesterday, stand up today.",
    "The best is yet to be.",
    "Do good and good will come to you.",
    "A positive mindset brings positive things.",
    "Positivity always wins…",
    "When things go wrong, don't go with them.",
    "Live life to the fullest and focus on the positive.",
    "Keep looking up…"
  ];
  void getRandomQuote(){
    final rnd = Random().nextInt(randomQuotes.length - 1);
    final quote = randomQuotes[rnd];

    emit(quote);
  }


}
