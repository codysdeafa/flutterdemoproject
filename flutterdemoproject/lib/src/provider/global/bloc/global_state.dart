part of 'global_bloc.dart';

sealed class GlobalState extends Equatable {
  const GlobalState();
  
  @override
  List<Object> get props => [];
}

final class GlobalInitial extends GlobalState {}

