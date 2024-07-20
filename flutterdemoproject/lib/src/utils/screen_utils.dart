

import 'package:flutter/material.dart';

import '../../my_app.dart';

MediaQueryData globalMediaQuery = MediaQuery.of(globalContext!);

///屏幕宽度
double  get screenWidth => globalMediaQuery.size.width;

///屏幕高度
double  get screenHeight => globalMediaQuery.size.height;

///状态栏高度
double get statusBarHeight => globalMediaQuery.viewPadding.top;

