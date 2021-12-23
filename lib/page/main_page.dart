import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/bean/place.dart';
import 'package:weather_project/widget/page_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MPPageController _pageController;
  var _bgNotifier = ValueNotifier<double>(0);
  var _progressNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = MPPageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: MPScaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: _bgNotifier,
              builder: (context, value, widget) {
                return Container(
                  color: Color.lerp(
                    Color(0xFF673AB7),
                    Color(0xFFF44336),
                    value,
                  ),
                );
              },
            ),
            Column(
              children: [
                _renderHeader(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: MPPageView(
                    controller: _pageController
                      ..addListener(() {
                        _bgNotifier.value = _pageController.page / 4;
                        _progressNotifier.value = _pageController.page;
                      }),
                    children: <Widget>[
                      PageItemWidget(
                        Place.beijing,
                        'assets/images/bg_beijing.jpg',
                      ),
                      PageItemWidget(
                        Place.shanghai,
                        'assets/images/bg_shanghai.png',
                      ),
                      PageItemWidget(
                        Place.guangzhou,
                        'assets/images/bg_guangzhou.png',
                      ),
                      PageItemWidget(
                        Place.shenzhen,
                        'assets/images/bg_shenzhen.jpg',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12, left: 48, right: 48),
                  width: 300,
                  height: 8,
                  child: Stack(
                    children: [
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      ValueListenableBuilder<int>(
                        valueListenable: _progressNotifier,
                        builder: (context, value, widget) {
                          return Container(
                            width: 300 * value / 3,
                            decoration: BoxDecoration(
                              color: Color.lerp(
                                Color(0xFFF44336),
                                Color(0xFF673AB7),
                                value / 3,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderHeader() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 64,
            height: 64,
          ),
          SizedBox(width: 16),
          Text(
            'MPWeather',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
