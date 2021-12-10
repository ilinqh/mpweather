import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/widget/forecast_widget.dart';
import 'package:weather_project/widget/life_index_widget.dart';
import 'package:weather_project/widget/now_weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'weather_page',
      body: ListView(
        children: [
          NowWeatherWidget(),
          ForecastWidget(),
          LifeIndexWidget(),
        ],
      ),
    );
  }
}
