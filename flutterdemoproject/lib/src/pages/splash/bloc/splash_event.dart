part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object?> get props => [];
}
//事件通知，开始处理配置
class SplashLoaded extends SplashEvent{
  final BuildContext context;
  const SplashLoaded(this.context);
}
