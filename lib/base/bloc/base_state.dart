part of 'base_cubit.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class BaseInitial extends BaseState {
  @override
  List<Object> get props => [];
}
