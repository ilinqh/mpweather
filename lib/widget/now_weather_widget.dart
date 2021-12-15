import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_project/bean/realtime.dart';
import 'package:weather_project/bean/sky.dart';
import 'package:weather_project/constant.dart';

class NowWeatherWidget extends StatelessWidget {
  final String placeName;
  final Realtime realtime;

  const NowWeatherWidget({
    Key? key,
    required this.placeName,
    required this.realtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _renderSkyBg(),
          _renderTitle(),
          _renderHomeBtn(),
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

  Widget _renderHomeBtn() {
    return Positioned(
      top: 20,
      left: 15,
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () async {
              (await SharedPreferences.getInstance())
                  .setString(KEY_PLACE_INFO, '');
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
            },
            child: Container(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/ic_home.png',
                fit: BoxFit.contain,
              ),
            ),
          );
        },
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
