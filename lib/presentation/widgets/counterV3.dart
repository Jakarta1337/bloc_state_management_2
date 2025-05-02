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
        BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counter1 > 5) {
              showAlert(context: context);
            }
          },
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counter1}',
                style: TextStyle(
                  fontSize: 30.0,
                  color:
                      state.counter1 > 0
                          ? Colors.green
                          : state.counter1 < 0
                          ? Colors.red
                          : Colors.black,
                ),
              );
            },
          ),
        ),
        IconButton(onPressed: widget.onPressed2, icon: Icon(widget.icon2)),
      ],
    );
  }
}

void showAlert({
  required BuildContext context,
  String title = 'Alert',
  String content = 'Something happened!',
  String buttonText = 'OK',
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
