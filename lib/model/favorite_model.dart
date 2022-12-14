import 'package:shopz_app/model/product.dart';

class FavoriteModel {
  static final productsfav = <Product>[];
  static alreadyfav(a) {
    if (productsfav.contains(a)) {
      return true;
    } else {
      return false;
    }
  }
}
