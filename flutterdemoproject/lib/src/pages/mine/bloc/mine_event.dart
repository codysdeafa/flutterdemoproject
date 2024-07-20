part of 'mine_bloc.dart';

sealed class MineEvent extends Equatable {
  const MineEvent();

  @override
  List<Object> get props => [];

}

final class MineLogoutEvent extends MineEvent{}


