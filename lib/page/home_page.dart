import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:mpflutter_template/color_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      name: 'home_page',
      appBar: MPAppBar(
        context: context,
        leading: SizedBox(),
        title: _renderActionBar(),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_place.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _renderCityList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderActionBar() {
    return Container(
      height: 60,
      color: ColorConstant.colorPrimary,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderCityList() {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(18),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index % 2 == 0 ? Colors.amber : Colors.brown,
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
                  'placeName $index',
                  style: TextStyle(
                    color: ColorConstant.color333333,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'placeAddress $index',
                  style: TextStyle(
                    color: ColorConstant.color666666,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
