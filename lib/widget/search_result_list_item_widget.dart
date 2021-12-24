import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/place.dart';

class SearchResultListItemWidget extends StatelessWidget {
  final Place place;

  SearchResultListItemWidget(this.place);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final _ = Navigator.of(context).pushNamed(
          '/weather',
          arguments: {'place': place},
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.cyan.shade700,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 80,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: MPIcon(
                      MaterialIcons.location_city,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      place.name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
