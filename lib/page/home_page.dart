import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_project/bean/place.dart';
import 'package:weather_project/color_constant.dart';
import 'package:weather_project/constant.dart';
import 'package:weather_project/network/place_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  var placeList = <Place>[];

  var inputEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        searchPlace(place: _controller.text);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future searchPlace({required String place}) async {
    setState(() {
      placeList.clear();
      inputEmpty = place.isEmpty;
    });
    if (place.isEmpty) {
      return;
    }
    final response = PlaceService.searchPlace(place: place);
    placeList.addAll(response);
  }

  Future checkCache() async {
    var placeInfo =
        (await SharedPreferences.getInstance()).get(KEY_PLACE_INFO) as String?;
    if (placeInfo?.isNotEmpty == true) {
      var map = json.decode(placeInfo!);
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(
        '/weather',
        arguments: map,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkCache();
    return MPScaffold(
      name: 'home_page',
      appBar: MPAppBar(
        context: context,
        leading: SizedBox(),
        title: _renderActionBar(),
      ),
      body: Stack(
        children: [
          _renderBackground(),
          _renderContent(),
        ],
      ),
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

  Widget _renderBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg_place.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _renderContent() {
    return inputEmpty
        ? Positioned.fill(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 16, top: 40, right: 16),
              child: Text(
                'only support search \n beijing / shanghai / guangzhou / shenzhen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.color333333,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : _renderSearchResult();
  }

  Widget _renderSearchResult() {
    return placeList.isEmpty
        ? Positioned.fill(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 16, top: 40, right: 16),
              child: Text(
                'Sad, Result Is Empty!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.color333333,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _renderCityList(),
              ],
            ),
          );
  }

  Widget _renderCityList() {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: placeList.length,
        itemBuilder: (context, index) {
          var item = placeList[index];
          return GestureDetector(
            onTap: () async {
              var map = {
                'lat': item.lat,
                'lng': item.lng,
                'placeName': item.name,
              };
              final _ = Navigator.of(context).pushNamed(
                '/weather',
                arguments: map,
              );
              (await SharedPreferences.getInstance())
                  .setString(KEY_PLACE_INFO, json.encode(map));
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
