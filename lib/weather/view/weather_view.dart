import 'package:cwiz/screens/error_screen.dart';
import 'package:cwiz/screens/splash_screen.dart';
import 'package:cwiz/weather/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherCubit>(context).fetchWeather();

    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state){
      if(state is WeatherLoading){
        return SplashScreen();
      }else if(state is WeatherLoaded){
        return Scaffold(
          body: Center(
            child: Text(state.weatherData.currentWeather!.name.toString())
          ),
        );
      }else if(state is WeatherFetchError){
        return ErrorPage();
      }
      else{
        return Scaffold(body: Center(child: Text("Error"),),);
      }
    });
  }
}



// Scaffold(
// appBar: AppBar(title: const Text('Cwiz')),
// body: Column(
// children: [
// BlocConsumer<WeatherCubit, WeatherState>(builder: (context, state){
// if (state is WeatherLoaded){
// return Text(state.weatherData.currentWeather!.name.toString());
// }
// else{
// return Text("default");
// }
// }, listener: (context, state) {}),
// Container(
// child: BlocListener<WeatherCubit, WeatherState>(
// listener: (context, state) {
// // When the first bloc's state changes, this will be called.
// //
// // Now we can add an event to the second bloc without it having
// // to know about the first bloc.
// // BlocProvider.of<WeatherCubit>(context);
// print(state);
// },
// child: TextButton(
// child: const Text('Hello'),
// onPressed: () {
// BlocProvider.of<WeatherCubit>(context).fetchWeather();
// },
// ),
// ),
// ),
// ],
// ),
//
// );