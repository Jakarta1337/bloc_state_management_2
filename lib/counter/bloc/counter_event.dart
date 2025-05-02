part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterState {
  const IncrementEvent(super.counter1, super.counter2, super.counter3);
}

class DecrementEvent extends CounterState {
  const DecrementEvent(super.counter1, super.counter2, super.counter3);
}
