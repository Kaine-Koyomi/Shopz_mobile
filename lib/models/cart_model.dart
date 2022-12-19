import 'package:shopz_app/models/product.dart';

class CartModel {
  static final cartproducts = <Product>[];
  static alreadyInCart(a) {
    if (cartproducts.contains(a)) {
      return true;
    } else {
      return false;
    }
  }
}
