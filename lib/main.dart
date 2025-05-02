import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'API/api.dart';
import 'API/cubit/post_cubit.dart';
import 'cubit/counter_cubit.dart';
import 'presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => PostCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const HomePage1(title: 'Bloc cubit'),
        debugShowCheckedModeBanner: false,
        routes: {'/api': (context) => const APIPage()},
      ),
    );
  }
}
