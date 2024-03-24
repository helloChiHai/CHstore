import 'package:chstore/models/ProductModel.dart';

abstract class ProductState {
  const ProductState();
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {
  final bool isLoading;
  ProductLoadingState({required this.isLoading});
}

class ProductSuccessState extends ProductState {
  final List<ProductModel> product;
  const ProductSuccessState({required this.product});
  @override
  List<Object> get props => [product];
}

class ProductFailureState extends ProductState {
  final String error;
  const ProductFailureState({required this.error});
  @override
  List<Object> get props => [error];
}
