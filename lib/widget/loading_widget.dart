import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://gitee.com/llqinhh/mpweather-images/raw/master/loading.svg',
        width: 100,
        height: 100,
      ),
    );
  }
}
