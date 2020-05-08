import 'dart:convert';

import 'package:easy_weather/model/weatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<Position> getPosition() async {
    Position position = await Geolocator() // get position
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<WeatherModel> getWeatherData(Position position) async {
    final url = 'http://api.openweathermap.org/data/2.5/weather?lat=' +
        position.latitude.toString() +
        '&lon=' +
        position.longitude.toString() +
        '&appid=75074f2a7474e1225e1572b6b935abb9';

    print(position.latitude.toString() + '/' + position.longitude.toString());

    final result = await http.Client().get(url);
    if (result.statusCode != 200) throw Exception("Can not connect");

    final weatherJson = json.decode(result.body);
    return WeatherModel.fromJson(weatherJson);
  }

  Future<List<WeatherModel>> getForecast(Position position) async {
    String url = 'http://api.openweathermap.org/data/2.5/forecast?lat=' +
        position.latitude.toString() +
        '&lon=' +
        position.longitude.toString() +
        '&appid=aa183938c8a2cfb8595c00a6a3f75c3f';

    print(position.latitude.toString() + '/' + position.longitude.toString());

    final result = await http.Client().get(url);
    if (result.statusCode != 200) throw Exception("Can not connect");

    final forecastJson = json.decode(result.body);

//    List<WeatherModel> weathers = WeatherModel.fromForecastJson(forecastJson);
//    return weathers;

    return (forecastJson['list'] as List)
        .map((_) => WeatherModel.fromJson2(_))
        .toList();
  }

  Future<WeatherModel> getWeather() async {
    Position position = await getPosition();
    var weather = await getWeatherData(position);
    var weathers = await getForecast(position);
    weather.forecast = weathers;
    return weather;
  }
}
