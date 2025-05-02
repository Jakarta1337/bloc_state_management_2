import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../API/api.dart';
import '../../counter/cubit/counter_cubit.dart';
import 'home2.dart';
import 'home3.dart';
import 'home4.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key, required this.title});

  final String title;

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomePage(),
    HomePage2(),
    HomePage3(),
    HomePage4(),
    APIPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const PageScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedItemColor: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Builder'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Selector'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Listener'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Consumer'),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'API'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("BlocBuilder"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().increment(1);
                },
                icon: Icon(Icons.add),
              ),

              BlocBuilder<CounterCubit, CounterState>(
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

              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement(1);
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
