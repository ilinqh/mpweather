import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_project/bean/place.dart';
import 'package:weather_project/color_constant.dart';
import 'package:weather_project/constant.dart';
import 'package:weather_project/network/place_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  var placeList = <Place>[];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        _searchPlace(place: _controller.text);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future _searchPlace({required String place}) async {
    setState(() {
      placeList.clear();
    });
    if (place.isEmpty) {
      return;
    }
    final response = PlaceService.searchPlace(place: place);
    placeList.addAll(response);
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'search_page',
      appBar: MPAppBar(
        context: context,
        title: _renderActionBar(),
      ),
      body: _renderPlaceList(),
    );
  }

  Widget _renderActionBar() {
    return Container(
      height: 60,
      width: double.infinity,
      color: ColorConstant.colorPrimary,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MPEditableText(
          controller: _controller,
          focusNode: FocusNode(),
          placeholder: 'input place here~',
          placeholderStyle: TextStyle(
            fontSize: 11,
            color: ColorConstant.color999999,
          ),
          style: TextStyle(
            fontSize: 16,
            color: ColorConstant.color666666,
          ),
        ),
      ),
    );
  }

  Widget _renderPlaceList() {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: placeList.length,
        itemBuilder: (context, index) {
          var item = placeList[index];
          return GestureDetector(
            onTap: () async {
              final _ = Navigator.of(context).pushNamed(
                '/weather',
                arguments: {'place': item},
              );
            },
            child: Container(
              height: 130,
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(18),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: ColorConstant.color333333,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '邮政编码：${item.adCode}',
                    style: TextStyle(
                      color: ColorConstant.color666666,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '经度：${item.lng} 纬度：${item.lat}',
                    style: TextStyle(
                      color: ColorConstant.color666666,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
