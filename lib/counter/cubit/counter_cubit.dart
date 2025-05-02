import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0, 0, 0));

  void increment(int counterIndex) => emit(
    CounterState(
      counterIndex == 1 ? state.counter1 + 1 : state.counter1,
      counterIndex == 2 ? state.counter2 + 1 : state.counter2,
      counterIndex == 3 ? state.counter3 + 1 : state.counter3,
    ),
  );

  void decrement(int counterIndex) => emit(
    CounterState(
      counterIndex == 1 ? state.counter1 - 1 : state.counter1,
      counterIndex == 2 ? state.counter2 - 1 : state.counter2,
      counterIndex == 3 ? state.counter3 - 1 : state.counter3,
    ),
  );
}
