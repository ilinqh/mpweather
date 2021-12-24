import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/place.dart';
import 'package:weather_project/network/place_service.dart';
import 'package:weather_project/widget/place_list_item_widget.dart';

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    var _place = _arguments?['place'] as Place?;
    var _placeList = PlaceService.searchPlace(place: _place?.name ?? '');
    return MPScaffold(
      name: _place?.name ?? '',
      backgroundColor: Color(0xFF736AB7),
      body: _place == null || _placeList.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: _placeList.length,
              itemBuilder: (context, index) {
                return PlaceListItemWidget(_placeList[index]);
              },
            ),
    );
  }
}
