import 'package:flutter/material.dart';
import 'package:weather_project/color_constant.dart';

class LifeIndexWidget extends StatelessWidget {
  const LifeIndexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _renderTitle(),
          SizedBox(height: 20),
          _renderWearInfo(),
          _renderOtherInfo(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _renderTitle() {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        '生活指数',
        style: TextStyle(color: ColorConstant.colorPrimary, fontSize: 20),
      ),
    );
  }

  Widget _renderWearInfo() {
    return Row(
      children: [
        _renderLifeIndexItem(
          iconPath: 'assets/images/ic_coldrisk.png',
          itemTitle: '感冒',
          itemText: 'coldRiskText',
        ),
        _renderLifeIndexItem(
          iconPath: 'assets/images/ic_dressing.png',
          itemTitle: '穿衣',
          itemText: 'dressingText',
        ),
      ],
    );
  }

  Widget _renderOtherInfo() {
    return Row(
      children: [
        _renderLifeIndexItem(
          iconPath: 'assets/images/ic_ultraviolet.png',
          itemTitle: '实时紫外线',
          itemText: 'ultravioletText',
        ),
        _renderLifeIndexItem(
          iconPath: 'assets/images/ic_carwashing.png',
          itemTitle: '洗车',
          itemText: 'carWashingText',
        ),
      ],
    );
  }

  Widget _renderLifeIndexItem({
    required String iconPath,
    required String itemTitle,
    required String itemText,
  }) {
    return Expanded(
      child: Container(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.only(left: 20),
              child: Image.asset(iconPath),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemTitle, style: TextStyle(fontSize: 12)),
                SizedBox(height: 4),
                Text(
                  itemText,
                  style: TextStyle(
                    color: ColorConstant.colorPrimary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
