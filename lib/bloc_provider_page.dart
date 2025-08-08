import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/conter.dart';
import 'package:flutter_bloc_app/bloc/data_widget.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});
  //final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    //CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Provider Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('ss', style: const TextStyle(fontSize: 50))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  //counterCubit.decrement();
                },
                icon: const Icon(Icons.remove, size: 50, color: Colors.red),
              ),
              IconButton(
                onPressed: () {
                  //counterCubit.increment();
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
