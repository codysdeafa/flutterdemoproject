
import 'package:demo/src/utils/extension/gesture_detector_extension.dart';
import 'package:demo/src/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';


///生成状态栏大小的控件
SizedBox statusBarBox() => SizedBox(
      height: statusBarHeight,
    );

Widget circularProgressLoading() => Center(
        child: CircularProgressIndicator(
      color: Colors.white,
    ));





Widget horizontalDivider({double height = 1}) => Container(
      height: height,
      color: Colors.grey,
    );

Widget customerTips() => RichText(
    textAlign: TextAlign.center,
    text: TextSpan(style: TextStyle(fontSize: 12.sp), children: [
      TextSpan(
          text: "为了您的隐私安全, 信息在确认后将无法修改\n如需帮助, 请",
          style: TextStyle(color: Colors.grey)),
      TextSpan(text: "联系客服", style: TextStyle(color: Colors.white))
    ])).onTap(() {});
//横纵向空白线
Widget emptyLine(
        {Axis axis = Axis.horizontal,
        double thickSize = 3,
        double lengthSize = 5,
        Color lineColor = Colors.white}) =>
    Container(
      width: axis != Axis.horizontal ? thickSize : lengthSize,
      height: axis != Axis.horizontal ? lengthSize : thickSize,
      decoration: BoxDecoration(
        color: lineColor,
        borderRadius: BorderRadius.circular(
            axis != Axis.horizontal ? lengthSize / 2 : thickSize / 2),
      ),
    );


