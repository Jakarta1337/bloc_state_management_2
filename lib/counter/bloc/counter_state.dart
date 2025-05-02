part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter1, counter2, counter3;
  const CounterState(this.counter1, this.counter2, this.counter3);

  @override
  List<Object> get props => [counter1, counter2, counter3];
}

class CounterInitial extends CounterState {
  const CounterInitial(super.counter1, super.counter2, super.counter3);
}

class Increment extends CounterState {
  const Increment(super.counter1, super.counter2, super.counter3);
}

class Decrement extends CounterState {
  const Decrement(super.counter1, super.counter2, super.counter3);
}
