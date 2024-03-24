import 'package:chstore/models/ProductModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference productCollectionReference =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>> getProduct() async {
    QuerySnapshot querySnapshot = await productCollectionReference.get();
    return querySnapshot.docs
        .map(
          (doc) => ProductModel(
            idProduct: doc['idProduct'],
            idEvent: doc['idEvent'],
            nameProduct: doc['nameProduct'],
            imgProduct: doc['imgProduct'],
            priceProduct: doc['priceProduct'],
          ),
        )
        .toList();
  }

  // Cập nhật giá sản phẩm dựa trên sự kiện và giá giảm
  void updateProductPrice(String eventId, double priceSale) async {
    QuerySnapshot querySnapshot = await productCollectionReference
        .where('idEvent', isEqualTo: eventId)
        .get();

    querySnapshot.docs.forEach((doc) async {
      ProductModel product = ProductModel(
        idProduct: doc['idProduct'],
        idEvent: doc['idEvent'],
        nameProduct: doc['nameProduct'],
        imgProduct: doc['imgProduct'],
        priceProduct: doc['priceProduct'],
      );

      // Cập nhật giá sản phẩm
      product.reducePriceProduct(eventId, priceSale);

      // Lưu cập nhật vào Firestore
      await productCollectionReference.doc(doc.id).update(product.toMap());
    });
  }
}
