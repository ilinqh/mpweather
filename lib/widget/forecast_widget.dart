import 'package:flutter/material.dart';
import 'package:weather_project/color_constant.dart';
import 'package:weather_project/widget/forecast_item_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
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
          Container(
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 20),
            child: Text(
              '预报',
              style: TextStyle(color: ColorConstant.colorPrimary, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ForecastItemWidget();
            },
          )
        ],
      ),
    );
  }
}
