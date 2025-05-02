import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../counter/cubit/counter_cubit.dart';
import '../widgets/counterV3.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("BlocListener"),
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
