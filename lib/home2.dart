import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'widgets/counterV2.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("BlocSelector"),
          Counter(
            onPressed1: () {
              context.read<CounterCubit>().increment(1);
            },
            icon1: Icons.add,
            icon2: Icons.remove,
            onPressed2: () {
              context.read<CounterCubit>().decrement(1);
            },
            counterIndex: 1,
          ),
          Counter(
            onPressed1: () {
              context.read<CounterCubit>().increment(2);
            },
            icon1: Icons.add,
            icon2: Icons.remove,
            onPressed2: () {
              context.read<CounterCubit>().decrement(2);
            },
            counterIndex: 2,
          ),
          Counter(
            onPressed1: () {
              context.read<CounterCubit>().increment(3);
            },
            icon1: Icons.add,
            icon2: Icons.remove,
            onPressed2: () {
              context.read<CounterCubit>().decrement(3);
            },
            counterIndex: 3,
          ),
        ],
      ),
    );
  }
}
