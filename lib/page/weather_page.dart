import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/realtime.dart';
import 'package:weather_project/widget/forecast_widget.dart';
import 'package:weather_project/widget/life_index_widget.dart';
import 'package:weather_project/widget/now_weather_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map? _arguments;
  Realtime? _realtime;

  Future _getRealtime({required String lng, required String lat}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.caiyunapp.com/v2.5/token/$lng,$lat/weather.json',
      ));
      _realtime =
          Realtime.fromJson(json.decode(response.body)['result']['realtime']);
      setState(() {});
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_arguments == null) {
      _arguments = ModalRoute.of(context)?.settings.arguments as Map?;
      _getRealtime(lng: _arguments!['lng'], lat: _arguments!['lat']);
    }
    return MPScaffold(
      name: 'weather_page',
      body: _realtime == null
          ? Container(color: Colors.red)
          : ListView(
              children: [
                NowWeatherWidget(
                  placeName: _arguments!['placeName'],
                  realtime: _realtime!,
                ),
                ForecastWidget(),
                LifeIndexWidget(),
              ],
            ),
    );
  }
}
