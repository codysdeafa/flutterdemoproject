import 'package:bot_toast/bot_toast.dart';
import 'package:demo/src/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'src/routers/pages.dart';

class MyApp extends StatelessWidget {
  static final appGlobalKey = GlobalKey<NavigatorState>();
  final _router = GoRouter(
      navigatorKey: appGlobalKey,
      observers: [BotToastNavigatorObserver()],
      routes: routers);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: provider,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(titleSpacing: 0),
            colorScheme: ColorScheme(
              brightness: true
                  ? Brightness.dark
                  : Brightness.light,
              primary: Colors.white,
              secondary: Colors.white,
              onPrimary: Colors.white,
              error: Colors.red,
              onSecondary: Colors.white,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white,
            ),
            useMaterial3: true,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

BuildContext? get globalContext => MyApp.appGlobalKey.currentContext;
