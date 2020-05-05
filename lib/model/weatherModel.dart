class WeatherModel {
  int id;
  int time;
  int sunrise;
  int sunset;

  String description;
  String iconCode;
  String main;
  String cityName;

  int humidity;
  int pressure;
  int visibility;
  double windSpeed;

  double temperature;
  double maxTemperature;
  double minTemperature;
  double feelsLike;

  Coord coord;

  List<WeatherModel> forecast;

  WeatherModel({
    this.id,
    this.time,
    this.sunrise,
    this.sunset,
    this.description,
    this.iconCode,
    this.main,
    this.cityName,
    this.humidity,
    this.pressure,
    this.visibility,
    this.windSpeed,
    this.temperature,
    this.maxTemperature,
    this.minTemperature,
    this.feelsLike,
    this.coord,
    this.forecast,
  });

  static WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['weather'][0]['id'],
      time: json['dt'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      main: json['weather'][0]['main'],
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      feelsLike: json['main']["feels_like"].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      visibility: json["visibility"],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      pressure: json['main']['pressure'],
      coord: Coord.fromJson(json["coord"]),
    );
  }

  static List<WeatherModel> fromForecastJson(Map<String, dynamic> json) {
    final weathers = List<WeatherModel>();
    for (final item in json['list']) {
      weathers.add(WeatherModel(
        time: item['dt'],
        description: json['weather']['main'],
        temperature: json['main']['temp'].toDouble(),
        maxTemperature: json['main']['temp_max'].toDouble(),
        minTemperature: json['main']['temp_min'].toDouble(),
      ));
    }
    return weathers;
  }
}

class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
