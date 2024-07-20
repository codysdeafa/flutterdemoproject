
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../../../my_app.dart';
import '../../../routers/pages_path.dart';
import 'package:go_router/go_router.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashLoaded>(_startInit);
  }
  _startInit(SplashLoaded event, Emitter<SplashState> emit) async {
    setPreferredOrientations();
    await initLib();
    setStatusBarTheme();
    await _fetchOssData(event);
  }

  _fetchOssData(SplashLoaded event) async {
    //进行初始化配置数据.....
    globalContext?.go(mainPage);
  }
}
