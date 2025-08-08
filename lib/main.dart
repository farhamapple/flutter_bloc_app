import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/bloc_consumer_page.dart';
import 'package:flutter_bloc_app/bloc_listener_page.dart';
import 'package:flutter_bloc_app/cubit_page.dart';
import 'package:flutter_bloc_app/observer_cubit_page.dart';
import 'package:flutter_bloc_app/stream_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocConsumerPage(), // Set HomePage as the home widget
    );
  }
}

// Create a separate HomePage widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CubitPage()),
                  );
                },
                child: const Text('Cubit Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StreamPage()),
                  );
                },
                child: const Text('Stream Page'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ObserverCubitPage(),
                    ),
                  );
                },
                child: const Text('Observer Cubit Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
