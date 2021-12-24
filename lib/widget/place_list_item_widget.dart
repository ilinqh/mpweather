import 'package:flutter/material.dart';
import 'package:weather_project/bean/place.dart';

class PlaceListItemWidget extends StatelessWidget {
  final Place place;

  PlaceListItemWidget(this.place);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/weather',
          arguments: {'place': place},
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 70,
                right: 20,
              ),
              padding: EdgeInsets.only(
                left: 50,
                right: 20,
              ),
              constraints: BoxConstraints(minHeight: 100),
              decoration: BoxDecoration(
                color: Color(0xff333366),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '邮编: ${place.adCode}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '经度: ${place.lng} 纬度: ${place.lat}',
                        style: TextStyle(
                          color: Color(0xffb6b2df),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ClipOval(
                child: Container(
                  color: Colors.white70,
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  child: Text(
                    place.simpleName,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
