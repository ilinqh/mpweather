import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/page/main_page.dart';
import 'package:weather_project/page/place_list_page.dart';
import 'package:weather_project/page/search_page.dart';
import 'package:weather_project/page/weather_page.dart';

void main() {
  runApp(MyApp());
  MPCore().connectToHostChannel();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MPApp(
      title: 'MPFlutter Demo',
      color: Colors.blue,
      routes: {
        '/': (context) => MainPage(),
        '/search': (context) => SearchPage(),
        '/weather': (context) => WeatherPage(),
        '/place_list': (context) => PlaceListPage(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}
