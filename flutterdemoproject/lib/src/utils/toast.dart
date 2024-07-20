import 'package:bot_toast/bot_toast.dart';
import 'package:demo/src/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';

toast(String? msg) {
  if (msg == null || msg.isEmpty) return;
  BotToast.showCustomNotification(
      align: Alignment.topCenter,
      toastBuilder: (CancelFunc cancelFunc) {
        return Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Container(
            constraints: BoxConstraints(maxWidth: screenWidth - 40.w),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
            child: IntrinsicWidth(
                child: Text(
              msg,
            )),
          ),
        );
      });
}

bool loadShowing = false;

// showLoadingDialog({bool clickClose = false}) {
//   BotToast.showCustomLoading(
//       toastBuilder: (context) {
//         return Lottie.asset(Assets.common.baseLoading,
//             width: 65.w, fit: BoxFit.cover);
//       },
//       onClose: () {
//         loadShowing = false;
//       },
//       clickClose: clickClose);
//   loadShowing = true;
// }

closeLoadingDialog() {
  BotToast.closeAllLoading();
}
