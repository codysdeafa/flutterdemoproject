part of 'global_bloc.dart';

sealed class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}
///跳转登陆事件
final  class GoLoginEvent extends GlobalEvent{
  final GoLoginType type;
  const GoLoginEvent({ this.type = GoLoginType.home});
}


