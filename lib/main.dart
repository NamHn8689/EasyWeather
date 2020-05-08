import 'package:easy_weather/screens/splashScreen.dart';
import 'package:easy_weather/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.dark,
      builder: (context, _brightness) {
        return MaterialApp(
//          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primaryColorLight: Color(0xFF5E9EE8),
            primaryColor: Color(0xFF5E9EE8),
//            primaryColor: Colors.black,
            brightness: _brightness,
            fontFamily: 'GoogleSans',
          ),
          home: SplashScreen(),
//          home: HomeScreen(),
        );
      },
    );
  }
}
