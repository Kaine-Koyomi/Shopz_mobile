import 'package:shopz_app/model/favorite_model.dart';

class FavoriteController {
  static addFav(a) {
    if (alreadyFav(a)) {
      FavoriteModel.productsfav.remove(a);
    } else {
      FavoriteModel.productsfav.add(a);
    }
  }

  static count() {
    return FavoriteModel.productsfav.length;
  }

  static favConsult(index, param) {
    switch (param) {
      case "image":
        return FavoriteModel.productsfav[index].image;

      case "title":
        return FavoriteModel.productsfav[index].title;

      case "price":
        return FavoriteModel.productsfav[index].price;
    }
  }

  static removeFromFav(index) {
    FavoriteModel.productsfav.remove(FavoriteModel.productsfav[index]);
  }

  static alreadyFav(a) {
    if (FavoriteModel.productsfav.contains(a)) {
      return true;
    } else {
      return false;
    }
  }
}
