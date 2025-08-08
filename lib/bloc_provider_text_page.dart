import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/text_bloc.dart';

class BlocProviderTextPage extends StatelessWidget {
  const BlocProviderTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Provider Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: BlocBuilder<TextBloc, TextState>(
          builder: (context, state) {
            if (state is TextStateLoading) {
              return CircularProgressIndicator();
            }

            if (state is TextStateSuccess) {
              return Text(state.result, style: TextStyle(fontSize: 50));
            }
            return Text('Helloo World', style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: Builder(
        builder: (ctx) {
          return FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<TextBloc>(
              //   context,
              // ).add(OnPressedTextEvent(result: 'Halo'));
              ctx.read<TextBloc>().add(OnPressedTextEvent());
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
