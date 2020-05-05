import 'dart:convert';

import 'package:easy_weather/model/weatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel> getWeather() async {
    Position position = await Geolocator() // get position
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    String url = 'http://api.openweathermap.org/data/2.5/weather?lat=' +
        position.latitude.toString() +
        '&lon=' +
        position.longitude.toString() +
        '&appid=75074f2a7474e1225e1572b6b935abb9';

//    print(position.latitude.toString());
//    print(position.longitude.toString());

    final result = await http.Client().get(url);
    if (result.statusCode != 200) throw Exception("Can not connect");

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return WeatherModel.fromJson(jsonDecoded);
  }
}

//  Future<List<WeatherModel>> getForecast() async {
//    Position position = await getPosition(); // get position
//    String url = 'http://api.openweathermap.org/data/2.5/forecast?lat=' +
//        position.latitude.toString() +
//        '&lon=' +
//        position.longitude.toString() +
//        '&appid=75074f2a7474e1225e1572b6b935abb9';
//
////    print(position.latitude.toString());
////    print(position.longitude.toString());
//
//    final result = await http.Client().get(url);
//    if (result.statusCode != 200)
//      throw Exception("Can not to fetch weather data");
//    final forecastJson = json.decode(result.body);
//    List<WeatherModel> weathers = WeatherModel.fromForecastJson(forecastJson);
//    return weathers;
//  }
//}
