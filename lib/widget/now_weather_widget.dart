import 'package:flutter/material.dart';
import 'package:weather_project/bean/realtime.dart';
import 'package:weather_project/bean/sky.dart';

class NowWeatherWidget extends StatelessWidget {
  final String placeName;
  final Realtime realtime;

  const NowWeatherWidget({
    Key? key,
    required this.placeName,
    required this.realtime,
  }) : super(key: key);

  final _subTitleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _renderSkyBg(),
          _renderTitle(),
          _renderBody(),
        ],
      ),
    );
  }

  Widget _renderSkyBg() {
    return Image.asset(Sky.getSky(realtime.skycon).bg, fit: BoxFit.cover);
  }

  Widget _renderTitle() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 60),
        alignment: Alignment.center,
        child: Text(
          placeName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Sky.getSky(realtime.skycon).info,
                style: _subTitleStyle,
              ),
              Text(
                ' | ',
                style: _subTitleStyle,
              ),
              Text(
                '空气指数 ${realtime.airQuality?.aqi?.chn.toString() ?? ''}',
                style: _subTitleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
