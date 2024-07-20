
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../gen/assets.gen.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //启动视频播放器
   VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashLoaded(context));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, splashState) {
          return Container(

            child: _buildContentByType(),
          );
        }));
  }

  Widget _buildContentByType() => Container();
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
