import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//顶部状态栏高度
double topBarHeight() {
  return ScreenUtil().statusBarHeight;
}
//底部安全距离
double bottomBarHeight() {
  return ScreenUtil().bottomBarHeight;
}
///根据key获取当前widgetSize
Size getWidgetSize(GlobalKey key){
  final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
  return renderBox.size;
}
/// 是否是正式版
bool get isRelease => kReleaseMode;
/// 是否是测试模式
bool get isDebug => !isRelease;

logP(msg) {
  if (kDebugMode) {
    print('💭$msg');
  }
}
bool isAndroid() {
  if (Platform.isAndroid) {
    return true;
  } else {
    return false;
  }
}
