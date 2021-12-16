import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_project/constant.dart';

class BackHomeButtonWidget extends StatelessWidget {
  final bool loading;

  const BackHomeButtonWidget({Key? key, this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () async {
            SharedPreferences.getInstance().then((value) {
              value.remove(KEY_PLACE_INFO);
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/');
            });
          },
          child: Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 20, left: 15),
            child: MPIcon(
              MaterialIcons.home,
              size: 30,
              color: loading == true ? Colors.black87 : Colors.white,
            ),
          ),
        );
      },
    );
  }
}
