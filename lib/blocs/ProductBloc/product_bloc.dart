import 'package:chstore/blocs/ProductBloc/product_event.dart';
import 'package:chstore/blocs/ProductBloc/product_state.dart';
import 'package:chstore/repository/ProductService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService = ProductService();
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) {});

    on<GetProduct>(
      (event, emit) async {
        emit(ProductLoadingState(isLoading: true));
        try {
          final products = await productService.getProduct();
          emit(ProductSuccessState(product: products));
        } catch (e) {
          emit(ProductFailureState(error: e.toString()));
        }
      },
    );
  }
}
