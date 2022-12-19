import 'package:flutter/material.dart';
import 'package:shopz_app/controllers/navigation_controller.dart';
import 'package:shopz_app/views/cart.dart';
import 'package:shopz_app/models/cart_model.dart';
import 'package:shopz_app/models/product.dart';
import 'package:shopz_app/views/home.dart';

class CartController {
  static decquan(index) {
    if (CartModel.cartproducts[index].quantity <= 1) {
      CartModel.cartproducts[index].quantity = 0;
      CartModel.cartproducts.remove(CartModel.cartproducts[index]);
    } else {
      CartModel.cartproducts[index].quantity--;
    }
  }

  static acrquan(index) {
    int storage = 10;
    if (CartModel.cartproducts[index].quantity == storage) {
      const Text("esse produto já tem todo o estoque");
    } else {
      CartModel.cartproducts[index].quantity++;
    }
  }

  static totalCart() {
    double sum = 0;
    for (var i = 0; i < CartModel.cartproducts.length; i++) {
      sum +=
          CartModel.cartproducts[i].price * CartModel.cartproducts[i].quantity;
    }
    return sum;
  }

  static addToCart(Product a, context) {
    if (alreadyInCart(a)) {
      showCart(context);
    } else {
      a.quantity++;
      CartModel.cartproducts.add(a);
    }
  }

  static alreadyInCart(a) {
    if (CartModel.cartproducts.contains(a)) {
      return true;
    } else {
      return false;
    }
  }

  static cartConsult(index, param) {
    switch (param) {
      case "image":
        return CartModel.cartproducts[index].image;

      case "title":
        return CartModel.cartproducts[index].title;

      case "price":
        return CartModel.cartproducts[index].price;

      case "quantity":
        return CartModel.cartproducts[index].quantity;

      case "count":
        return CartModel.cartproducts.length;

      case "empty":
        return CartModel.cartproducts.isEmpty;
    }
  }

  static removeFromCart(index) {
    CartModel.cartproducts[index].quantity = 0;
    CartModel.cartproducts.remove(CartModel.cartproducts[index]);
  }

  static void showCart(a) {
    NavigatorController.actualPage = const Cart();
    Navigator.of(a).push(
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
}
