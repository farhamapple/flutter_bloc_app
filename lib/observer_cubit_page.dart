import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialState = 0}) : super(initialState);

  int initialState;
  int? currentState;
  int? nextState;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    //print('CounterCubit state changed: ${change}');
    currentState = change.currentState;
    nextState = change.nextState;
  }
}

class NamaCubit extends Cubit<String> {
  NamaCubit() : super('');

  void ubahNama(String namaBaru) {
    emit(namaBaru);
  }
}

// ignore: must_be_immutable
class ObserverCubitPage extends StatelessWidget {
  ObserverCubitPage({super.key});

  CounterCubit myCounterCubit1 = CounterCubit(initialState: 0);
  final _namaCubit = NamaCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Observer Cubit Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action for button 1
                  myCounterCubit1.decrement();
                },
                child: const Text('-'),
              ),
              StreamBuilder(
                initialData: myCounterCubit1.initialState,
                stream: myCounterCubit1.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action for button 2
                  myCounterCubit1.increment();
                },
                child: const Text('+'),
              ),
            ],
          ),
          StreamBuilder(
            stream: myCounterCubit1.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current State: ${myCounterCubit1.currentState ?? 'N/A'}',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Next State: ${myCounterCubit1.nextState ?? 'N/A'}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: _namaCubit.stream,
                  builder: (context, snapshot) {
                    return Text(_namaCubit.state);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _namaCubit.ubahNama('John Doe');
                  },
                  child: Text('Ubah Nama'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
