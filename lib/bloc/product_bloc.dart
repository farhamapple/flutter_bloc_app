import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/product_data_dummy.dart';
import 'package:flutter_bloc_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<OnProductEventCalled>((event, emit) async {
      // TODO: implement event handler
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(ProductLoaded(products: productsDataDummy));
    });
  }
}
