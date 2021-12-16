import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/daily.dart';
import 'package:weather_project/bean/realtime.dart';
import 'package:weather_project/constant.dart';
import 'package:weather_project/widget/back_home_button_widget.dart';
import 'package:weather_project/widget/forecast_widget.dart';
import 'package:weather_project/widget/life_index_widget.dart';
import 'package:weather_project/widget/loading_widget.dart';
import 'package:weather_project/widget/now_weather_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map? _arguments;
  Realtime? _realtime;
  Daily? _daily;

  Future _getRealtime({required String lng, required String lat}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.caiyunapp.com/v2.5/$API_TOKEN/$lng,$lat/weather.json',
      ));
      _realtime =
          Realtime.fromJson(json.decode(response.body)['result']['realtime']);
      _daily = Daily.fromJson(json.decode(response.body)['result']['daily']);
      setState(() {});
    } catch (e) {
      return null;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_arguments == null) {
      _arguments = ModalRoute.of(context)?.settings.arguments as Map?;
      _getRealtime(lng: _arguments!['lng'], lat: _arguments!['lat']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'weather_page',
      body: _realtime == null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackHomeButtonWidget(loading: true),
                LoadingWidget(),
              ],
            )
          : ListView(
              children: [
                NowWeatherWidget(
                  placeName: _arguments!['placeName'],
                  realtime: _realtime!,
                ),
                _daily == null ? Container() : ForecastWidget(daily: _daily!),
                _daily == null ? Container() : LifeIndexWidget(daily: _daily!),
              ],
            ),
    );
  }
}
