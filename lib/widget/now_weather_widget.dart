import 'package:flutter/material.dart';
import 'package:weather_project/bean/realtime.dart';
import 'package:weather_project/bean/sky.dart';

class NowWeatherWidget extends StatelessWidget {
  final Realtime realtime;

  const NowWeatherWidget({
    Key? key,
    required this.realtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      child: Container(
        height: 530,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _renderSkyBg(),
            _renderBody(),
          ],
        ),
      ),
    );
  }

  Widget _renderSkyBg() {
    return Image.asset(Sky.getSky(realtime.skycon).bg, fit: BoxFit.cover);
  }

  Widget _renderBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${realtime.temperature.toInt().toString()} ℃',
            style: TextStyle(
              color: Colors.white,
              fontSize: 70,
            ),
          ),
          Text(
            '${Sky.getSky(realtime.skycon).info} | 空气指数 ${realtime.airQuality?.aqi?.chn.toString() ?? ''}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
