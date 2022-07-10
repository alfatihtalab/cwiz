class AppUrl {
  static const String liveBaseURL =
  "https://api.openweathermap.org/data/2.5/";


  static const String currentWeatherURL = liveBaseURL + "weather";

  static const String fiveDaysForecastURL = liveBaseURL + "forecast";

}


//?lat={lat}&lon={lon}&appid={API key}