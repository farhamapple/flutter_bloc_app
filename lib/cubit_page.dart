import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialState = 0}) : super(initialState);

  int initialState;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class TotalCubit extends Cubit<int> {
  TotalCubit({this.initialState = 0}) : super(initialState);

  int initialState;

  void updateTotal(int value) => emit(value);
}

// ignore: must_be_immutable
class CubitPage extends StatelessWidget {
  CubitPage({super.key});

  CounterCubit myCounterCubit1 = CounterCubit(initialState: 0);
  CounterCubit myCounterCubit2 = CounterCubit(initialState: 0);
  TotalCubit myTotalCubit = TotalCubit(initialState: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                  //print('myCounterCubit1: ${myCounterCubit1.state}');
                  myTotalCubit.updateTotal(
                    myCounterCubit1.state + myCounterCubit2.state,
                  );
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action for button 1
                  myCounterCubit2.decrement();
                },
                child: const Text('-', style: TextStyle(color: Colors.white)),
              ),
              StreamBuilder(
                initialData: myCounterCubit2.initialState,
                stream: myCounterCubit2.stream,
                builder: (context, snapshot) {
                  myTotalCubit.updateTotal(
                    myCounterCubit1.state + myCounterCubit2.state,
                  );
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action for button 2
                  myCounterCubit2.increment();
                },
                child: const Text('+', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Data :',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              StreamBuilder(
                initialData: myTotalCubit.initialState,
                stream: myTotalCubit.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
