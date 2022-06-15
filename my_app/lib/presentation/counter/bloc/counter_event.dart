import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
