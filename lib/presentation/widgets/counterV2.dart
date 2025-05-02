import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/counter_cubit.dart';

class Counter extends StatefulWidget {
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final IconData icon1, icon2;
  final int counterIndex;

  const Counter({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.icon1,
    required this.icon2,
    required this.counterIndex,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(onPressed: widget.onPressed1, icon: Icon(widget.icon1)),
        // BlocBuilder<CounterCubit, CounterState>(
        //   builder: (context, state) {
        //     final value =
        //         widget.counterIndex == 1
        //             ? state.counter1
        //             : widget.counterIndex == 2
        //             ? state.counter2
        //             : state.counter3;
        //     return Text('$value', style: const TextStyle(fontSize: 30.0));
        //   },
        // ),
        BlocSelector<CounterCubit, CounterState, int>(
          selector: (state) {
            return widget.counterIndex == 1
                ? state.counter1
                : widget.counterIndex == 2
                ? state.counter2
                : state.counter3;
          },
          builder: (context, value) {
            // print('Counter${widget.counterIndex} value: $value');
            return Text('$value', style: const TextStyle(fontSize: 30.0));
          },
        ),
        IconButton(onPressed: widget.onPressed2, icon: Icon(widget.icon2)),
      ],
    );
  }
}
