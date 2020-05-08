import 'package:easy_weather/model/weatherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Forecast extends StatelessWidget {
  List<WeatherModel> forecast;

  Forecast({@required this.forecast});

  DateTime _getTime(int time) => DateTime.fromMillisecondsSinceEpoch(time);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 28;

//    return SizedBox(height: 600.0);
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 0, bottom: 6),
          alignment: Alignment.center,
          child: Text(
            '5day forecast',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8.0)),
              width: width,
              height: 160.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: width / 4.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text((index > 0)
                            ? (DateFormat("d/MM").format(_getTime(
                                        forecast[index].time * 1000)) ==
                                    DateFormat("d/MM").format(_getTime(
                                        forecast[index - 1].time * 1000)))
                                ? ""
                                : DateFormat("d/MM").format(
                                    _getTime(forecast[index].time * 1000))
                            : DateFormat("d/MM")
                                .format(_getTime(forecast[index].time * 1000))),
                        Text(DateFormat("HH")
                                .format(_getTime(forecast[index].time * 1000)) +
                            "h"),
//                Text(DateFormat("Hs").format(_getTime(forecast[index].time*1000))),

                        Image.network('http://openweathermap.org/img/wn/' +
                            forecast[index].iconCode +
                            '.png'),
                        Text(forecast[index].description.toString()),
                        Text((forecast[index].maxTemperature - 273.15)
                                .round()
                                .toString() +
                            '°/ ' +
                            (forecast[index].minTemperature - 273.15)
                                .round()
                                .toString() +
                            '°'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
