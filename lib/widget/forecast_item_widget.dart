import 'package:flutter/material.dart';
import 'package:weather_project/bean/daily.dart';
import 'package:weather_project/bean/sky.dart';

class ForecastItemWidget extends StatelessWidget {
  final Skycon skycon;
  final Temperature temperature;

  const ForecastItemWidget({
    Key? key,
    required this.skycon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(skycon.date.substring(0, 10)),
          ),
          Container(
            height: 20,
            width: 20,
            child: Image.network(Sky.getSky(skycon.value).icon),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text(Sky.getSky(skycon.value).info),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '${temperature.min.toInt()} ~ ${temperature.max.toInt()} ℃',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
