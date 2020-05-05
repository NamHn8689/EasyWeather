import 'package:easy_weather/model/weatherModel.dart';
import 'package:easy_weather/screens/forecastWidget.dart';
import 'package:easy_weather/services/WeatherRepo.dart';
import 'package:easy_weather/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherRepo dataState = WeatherRepo();

  @override
  void initState() {
    dataState.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_4, size: 20),
            onPressed: () {
              ThemeBuilder.of(context).changeTheme();
            },
          )
        ],
      ),
      body: FutureBuilder<WeatherModel>(
        future: dataState.getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Container(
                  width: width,
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  snapshot.data.cityName,
                                  style: TextStyle(
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Divider(thickness: 3.5),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  child: Text(
                                    'Feels like ' +
                                        (snapshot.data.feelsLike - 273.15)
                                            .toInt()
                                            .toString() +
                                        '°',
                                    style: TextStyle(fontSize: 18.5),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      (snapshot.data.temperature - 273.15)
                                              .toInt()
                                              .toString() +
                                          '°',
                                      style: TextStyle(fontSize: 150.0),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Image.network(
                                              'http://openweathermap.org/img/wn/' +
                                                  snapshot.data.iconCode +
                                                  '.png',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                '' +
                                                    snapshot.data.description[0]
                                                        .toUpperCase() +
                                                    snapshot.data.description
                                                        .substring(1),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'Day ' +
                                      (snapshot.data.maxTemperature - 273.15)
                                          .toInt()
                                          .toString() +
                                      '° ↑' +
                                      ' • ' +
                                      'Night ' +
                                      (snapshot.data.minTemperature - 273.15)
                                          .toInt()
                                          .toString() +
                                      '° ↓',
                                  style: TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Divider(thickness: 3),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 0, left: 15, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.5,
                                            color: Colors.lightBlueAccent),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      disabledColor: Colors.white,
                                      disabledElevation: 6.0,
                                      disabledTextColor: Colors.black,
                                      onPressed: null,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width / 3,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/raindrops.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "  Humidity",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              snapshot.data.humidity
                                                      .toString() +
                                                  "%",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.0),
                                            )
                                          ],
                                        ),
                                      ),
//                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.5,
                                            color: Colors.orangeAccent),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
//                                      elevation: 5.0,
                                      onPressed: null,
                                      disabledColor: Colors.white,
                                      disabledElevation: 6.0,
                                      disabledTextColor: Colors.black,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width / 3,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: Colors.orangeAccent),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/sunny.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "  Visibility",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              snapshot.data.visibility.toString() +
                                                  ' m',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.5,
                                            color: Colors.purpleAccent),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      elevation: 2.0,
                                      onPressed: null,
                                      disabledColor: Colors.white,
                                      disabledElevation: 6.0,
                                      disabledTextColor: Colors.black,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width / 3,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: Colors.purpleAccent),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/wind.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "  Wind",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              snapshot.data.windSpeed
                                                      .toString() +
                                                  " km/h",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.5, color: Colors.pinkAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      elevation: 2.0,
                                      onPressed: null,
                                      disabledColor: Colors.white,
                                      disabledElevation: 6.0,
                                      disabledTextColor: Colors.black,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width / 3,
                                        height: 120.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: Colors.pinkAccent),
                                            ),
                                            SizedBox(height: 20.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/images/brakes.png',
                                                  width: 20,
                                                ),
                                                Text(
                                                  "  Pressure",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6.0),
                                            Text(
                                              snapshot.data.pressure
                                                      .toString() +
                                                  " hPa",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 25.0),
                                            )
                                          ],
                                        ),
                                      ),
//                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Divider(thickness: 3),
                              ),
                            ],
                          ),
                        ),
                        Forecast(),
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
