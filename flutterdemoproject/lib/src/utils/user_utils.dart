
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget getUserIconWidget(int avatarIndex,
    {double width = 42, double height = 42, bool needBorder = true}) {
  if (avatarIndex > 23 || avatarIndex < 0) {
    avatarIndex = 0;
  }
  return Container(
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(
        border: needBorder
            ? Border.fromBorderSide(
                BorderSide(color: Colors.white, width: 1.w),
              )
            : null,
        borderRadius: BorderRadius.all(Radius.circular(width.r)),
        image: DecorationImage(
            image: AssetImage(
                "assets/common/avatar/user_icon_$avatarIndex.webp"))),
  );
}


String getUserCenterVipLevelIconPath(int? level) {
  level ??= 0;
  if (level > 50) {
    level = 50;
  }
  return "assets/user/level/user_vip_grade_$level.webp";
}
