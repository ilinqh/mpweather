import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/place.dart';
import 'package:weather_project/color_constant.dart';
import 'package:weather_project/network/place_service.dart';
import 'package:weather_project/widget/search_result_list_item_widget.dart';

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
      backgroundColor: Color(0xFF00BCD4),
      // appBar: MPAppBar(
      //   context: context,
      //   backgroundColor: Color(0xFF00BCD4),
      //   leading: _renderLeading(),
      //   title: _renderActionBar(),
      // ),
      body: _renderPlaceList(),
    );
  }

  Widget _renderLeading() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 44,
        height: 44,
        child: Center(
          child: Container(
            width: 24,
            height: 24,
            child: MPIcon(
              MaterialIcons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderActionBar() {
    return Container(
      height: 48,
      width: double.infinity,
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
          placeholder: '请输入关键字',
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
    return Column(
      children: [
        _renderActionBar(),
        Expanded(
          child: ListView.builder(
            itemCount: placeList.length,
            itemBuilder: (context, index) {
              var item = placeList[index];
              return SearchResultListItemWidget(item);
            },
          ),
        )
      ],
    );
  }
}
