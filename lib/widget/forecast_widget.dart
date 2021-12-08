import 'package:flutter/material.dart';
import 'package:mpflutter_template/color_constant.dart';
import 'package:mpflutter_template/widget/forecast_item_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '预报',
            style: TextStyle(color: ColorConstant.colorPrimary, fontSize: 20),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ForecastItemWidget();
            },
          )
        ],
      ),
    );
  }
}
