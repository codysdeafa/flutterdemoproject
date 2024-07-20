
import 'package:flutter/material.dart';

extension GestureDetectorExtension on Widget {
  Widget onDoubleTap(Function() function) => GestureDetector(
        onDoubleTap: function,
        child: this,
      );

  Widget onLongPress(Function() function) => GestureDetector(
        onLongPress: function,
        child: this,
      );

  Widget onTap(Function() function, {bool needLogin = false}) =>
      GestureDetector(
        onTap: () {
          // if (needLogin&&!UserRepsitory.instance.isLogin()) {
          //   showLoginTipsDialog(globalContext!);
          //   return;
          // }
          function();
        },
        behavior: HitTestBehavior.opaque,
        child: this,
      );
}
