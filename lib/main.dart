import 'package:easy_weather/theme.dart';
import 'package:flutter/material.dart';

import 'screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//   = WeatherRepo();

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.dark  ,
      builder: (context, _brightness) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primaryColor: Colors.black,
            brightness: _brightness,
            fontFamily: 'GoogleSans',
          ),
//          home: SplashScreen(),
          home: HomeScreen(),
        );
      },
    );
  }
}
