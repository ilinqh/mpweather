import 'package:flutter/material.dart';

class ForecastItemWidget extends StatelessWidget {
  const ForecastItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text('dateInfo'),
          ),
          Container(
            height: 20,
            width: 20,
            color: Colors.brown,
            child: Text('skyIcon'),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text('skyInfo'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text('temperatureInfo'),
            ),
          ),
        ],
      ),
    );
  }
}
