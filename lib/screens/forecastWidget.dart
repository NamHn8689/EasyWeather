
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 28;
    final height = 300.0;
//    return SizedBox(height: 600.0);
    return Container(
      width: width,
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: width / 5,
            height: height,
          ),
          Container(
            color: Colors.blue,
            width: width / 5,
            height: height,
          ),
          Container(
            color: Colors.green,
            width: width / 5,
            height: height,
          ),
          Container(
            color: Colors.yellowAccent,
            width: width / 5,
            height: height,
          ),
          Container(
            color: Colors.amberAccent,
            width: width / 5,
            height: height,
          ),
        ],
      ),
    );
  }
}
//    return Card(
//      elevation: 3.0,
//      child: Container(
//        height: 500,
//        width: width,
//        child: Row(
//          children: <Widget>[
//            Container(
//              width: width / 5,
//              color: Colors.black,
//            )
//          ],
//        ),
//      ),
//    );
