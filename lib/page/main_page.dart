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
  var _notifier = ValueNotifier<double>(0);

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
    return MPScaffold(
      backgroundColor: Color(0xFFAA3DB7),
      body: Column(
        children: [
          _renderHeader(),
          _renderList(),
        ],
      ),
      floatingBody: _renderFloating(),
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

  Widget _renderList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Expanded(
            child: MPPageView(
              controller: _pageController
                ..addListener(() {
                  _notifier.value = _pageController.page / 3;
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
          _renderProgress(),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _renderProgress() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 300,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        ValueListenableBuilder<double>(
          valueListenable: _notifier,
          builder: (context, value, widget) {
            return Container(
              width: 300 * value,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.lerp(
                  Color(0xFFF44336),
                  Color(0xFF673AB7),
                  value,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _renderFloating() {
    return Positioned(
      bottom: 80,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/search');
        },
        child: Container(
          width: 72,
          height: 64,
          padding: EdgeInsets.only(left: 8, top: 8, right: 16, bottom: 8),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.withOpacity(0.4),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
          child: ClipOval(
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              color: Colors.deepPurpleAccent.withOpacity(0.6),
              child: MPIcon(
                MaterialIcons.search,
                color: Colors.white60,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
