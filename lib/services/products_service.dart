import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organico_app/model/products_model.dart';

class ServiceProducts {
  static Future<ProductsModel> getProducts() async {
    DocumentSnapshot<Map<String, dynamic>> product = await FirebaseFirestore
        .instance
        .collection("products")
        .doc("Products")
        .get();

    return ProductsModel.fromJson(product.data()!);
  }
}
