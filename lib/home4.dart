import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'widgets/counterV4.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("BlocConsumer"),
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
        ],
      ),
    );
  }
}
