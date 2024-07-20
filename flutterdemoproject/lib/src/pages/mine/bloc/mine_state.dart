part of 'mine_bloc.dart';

sealed class MineState extends Equatable {
  const MineState();

  @override
  List<Object> get props => [];
}

final class MineInitial extends MineState {}

