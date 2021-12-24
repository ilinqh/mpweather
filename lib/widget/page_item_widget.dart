import 'package:flutter/material.dart';
import 'package:weather_project/bean/place.dart';

class PageItemWidget extends StatelessWidget {
  final Place place;
  final String imgUrl;

  PageItemWidget(this.place, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   '/place_list',
        //   arguments: {'place': place},
        // );
        Navigator.of(context).pushNamed('/search');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                alignment: Alignment.topLeft,
                child: Image.asset(imgUrl, fit: BoxFit.cover),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  place.name,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '经度：${place.lng}\n 纬度：${place.lat}',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
