import 'package:flutter/cupertino.dart';

class FeelsLikeData {
  FeelsLikeData({required this.dayTime,
    required this.secondaryText,
    required this.quotes,
    required this.imgUrl});

  String dayTime;
  String secondaryText;
  List<String> quotes;
  String imgUrl;
}


List<String> morningQuotes = [
  "Morning is wonderful. Its only drawback is that it comes at such an inconvenient time of day.",
  "Morning is an important time of day, because how you spend your morning can often tell you what kind of day you are going to have.",
  "I love the smell of book ink in the morning.",
  "Planning in the morning"
];
List<String> dayQuotes = [
  "Be yourself; everyone else is already taken.",
  "You love me. Real or not real?",
  "Be happy and cleaver",
  "Be happy and cleaver"
];
List<String> nighQuotes = [
  "It's very beautiful over there. I don\'t know where there is, but I believe it\'s somewhere, and I hope it\'s beautiful."
      "Learn from yesterday, live for today, hope for tomorrow",
      "Learn from yesterday, live for today, hope for tomorrow",
      "Learn from yesterday, live for today, hope for tomorrow",
];
List<String> eveQuotes = [
  "If you fell down yesterday, stand up today.",
  "The best is yet to be.",
  "Try to be a rainbow in someone\'s cloud.",
  "Do good and good will come to you.",
  "A positive mindset brings positive things.",
  "Positivity always wins…",
  "When things go wrong, don't go with them.",
  "Live life to the fullest and focus on the positive.",
  "Keep looking up…"

];
List<FeelsLikeData> feelsLikeList = [
  FeelsLikeData(dayTime: "Day",
      secondaryText: "Have a nice day",
      quotes: dayQuotes,
      imgUrl: "https://wallpaperboat.com/wp-content/uploads/2021/04/14/75026/sunny-day-08.jpg"),
  FeelsLikeData(dayTime: "Morning",
      secondaryText: "Best time to invest",
      quotes: morningQuotes,
      imgUrl: "https://th.bing.com/th/id/OIP.V-9CjelQVgcrG1eL0LJq1QHaFS?pid=ImgDet&w=499&h=356&rs=1"),
  FeelsLikeData(dayTime: "Night",
      secondaryText: "Sleep well",
      quotes: nighQuotes,
      imgUrl: "https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmlnaHR8ZW58MHx8MHx8&w=1000&q=80"),
  FeelsLikeData(dayTime: "Evening",
      secondaryText: "Don't miss your chance",
      quotes: eveQuotes,
      imgUrl: "https://images.unsplash.com/photo-1472120435266-53107fd0c44a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXZlbmluZ3xlbnwwfHwwfHw%3D&w=1000&q=80")

];
