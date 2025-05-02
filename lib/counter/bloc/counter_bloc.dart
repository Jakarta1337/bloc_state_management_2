import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0, 0, 0)) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        emit(
          Increment(state.counter1 + 1, state.counter2 + 1, state.counter3 + 1),
        );
      } else {
        emit(
          Decrement(state.counter1 - 1, state.counter2 - 1, state.counter3 - 1),
        );
      }
    });
  }
}
