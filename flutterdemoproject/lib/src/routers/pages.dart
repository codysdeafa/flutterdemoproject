import 'package:demo/src/routers/slide_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../pages/splash/bloc/splash_bloc.dart';
import '../pages/splash/view/splash_page.dart';
import 'pages_path.dart';

final routers = [
  GoRoute(
    path: splashPage,
    pageBuilder: (_, state) => SlidePage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => SplashBloc(),
          child: const SplashPage(),
        )),
  ),


];
