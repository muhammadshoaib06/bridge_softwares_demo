import 'package:bridge_softwares_demo/models/cart_product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static late Box<CartProductModel> cartProductsBox;

  static double cartSubTotal() {
    double total = 0.0;

    for (int i = 0; i < cartProductsBox.length; i++) {
      CartProductModel product = cartProductsBox.getAt(i)!;
      total += product.price;
    }

    return total;
  }
}
