
import 'package:demo/src/cache/shared_preferences/shared_preferences_helper.dart';
import 'package:demo/src/utils/channel_utils.dart';
import 'package:demo/src/utils/device_utils.dart';
import 'package:demo/src/utils/package_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'my_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('zh_CN', null); // 中文区域设置
  runApp(MyApp());
}

void setPreferredOrientations() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

initLib() async {
  //初始化通道
  ChannelUtils.init();
  await SharedPreferencesHelper.init();
  await PackageUtils.init();
  await DeviceUtils.init();
}


void setStatusBarTheme() {
  if (true) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }
}
