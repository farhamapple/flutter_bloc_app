import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TextEvent {}

class OnPressedTextEvent extends TextEvent {}

abstract class TextState {}

class TextInitial extends TextState {}

class TextStateLoading extends TextState {}

class TextStateSuccess extends TextState {
  final String result;

  TextStateSuccess({required this.result});
}

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial()) {
    on<OnPressedTextEvent>((event, emit) async {
      emit(TextStateLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(TextStateSuccess(result: "Success"));
    });
  }
}
