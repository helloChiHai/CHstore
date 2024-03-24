abstract class ProductEvent {
  const ProductEvent();
  List<Object> get props => [];
}

class GetProduct extends ProductEvent {
  const GetProduct();

  @override
  List<Object> get props => [];
}
