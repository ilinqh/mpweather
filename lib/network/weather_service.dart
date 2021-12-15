import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/bean/realtime.dart';

class WeatherService {
  static Future<Realtime?> getRealtime(
      {required String lng, required String lat}) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.caiyunapp.com/v2.5/8dKj4HXKe2g02T2L/$lng,$lat/weather.json',
      ));
      var realtime =
          Realtime.fromJson(json.decode(response.body)['result']['realtime']);
      return realtime;
    } catch (e) {
      return null;
    }
  }
}
