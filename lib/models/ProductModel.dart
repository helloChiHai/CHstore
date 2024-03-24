class ProductModel {
  final String idProduct;
  final String idEvent;
  final String nameProduct;
  final String imgProduct;
  double priceProduct;

  ProductModel({
    required this.idProduct,
    required this.idEvent,
    required this.nameProduct,
    required this.imgProduct,
    required String priceProduct,
  }) : priceProduct = double.parse(priceProduct);

  Map<String, dynamic> toMap() {
    return {
      'idProduct': idProduct,
      'idEvent': idEvent,
      'nameProduct': nameProduct,
      'imgProduct': imgProduct,
      'priceProduct': priceProduct,
    };
  }

  // cập nhật giá sản phẩm nếu có sự kiện
  void reducePriceProduct(String eventId, double priceSale) {
    if (idEvent == eventId) {
      priceProduct *= priceSale;
    }
  }
}
