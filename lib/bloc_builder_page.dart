import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/conter.dart';

class BlocBuilderPage extends StatelessWidget {
  BlocBuilderPage({super.key});

  CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Builder Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // StreamBuilder(
          //   stream: _counterCubit.stream,
          //   builder: (context, asyncSnapshot) {
          //     return Text(
          //       '${asyncSnapshot.data ?? 0}',
          //       style: TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
          BlocBuilder<CounterCubit, int>(
            bloc: _counterCubit,
            buildWhen: (previous, current) {
              if (current % 2 == 0) {
                print('Counter is a multiple of 5: $current');
                return true;
              } else {
                print('Counter is not a multiple of 5: $current');
                return false;
              }
            },
            builder: (context, state) =>
                Text('$state', style: TextStyle(fontSize: 50)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _counterCubit.decrement();
                },
                icon: const Icon(Icons.remove, size: 50, color: Colors.red),
              ),
              IconButton(
                onPressed: () {
                  _counterCubit.increment();
                },
                icon: const Icon(Icons.add, size: 50, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
