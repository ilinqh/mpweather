import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';
import 'package:mpflutter_template/page/home_page.dart';
import 'package:mpflutter_template/page/weather_page.dart';

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
        '/': (context) => HomePage(),
        '/weather': (context) => WeatherPage(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}
