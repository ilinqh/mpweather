import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';
import 'package:weather_project/page/home_page.dart';
import 'package:weather_project/page/main_page.dart';
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
        '/home': (context) => HomePage(),
        '/weather': (context) => WeatherPage(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}
