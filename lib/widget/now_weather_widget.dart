import 'package:flutter/material.dart';

class NowWeatherWidget extends StatelessWidget {
  const NowWeatherWidget({Key? key}) : super(key: key);

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
    return Image.asset('assets/images/bg_clear_day.jpg', fit: BoxFit.cover);
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
          'placeName',
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
            'currentTemp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 70,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'currentSky',
                style: _subTitleStyle,
              ),
              Text(
                ' | ',
                style: _subTitleStyle,
              ),
              Text(
                'currentAQI',
                style: _subTitleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
