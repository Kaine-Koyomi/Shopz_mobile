import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopz_app/view/body.dart';
import 'package:shopz_app/view/cart.dart';
import 'package:shopz_app/view/favorite.dart';
import 'package:shopz_app/view/home.dart';
import 'package:shopz_app/view/profile.dart';

class NavigatorController {
  static var selectedIndex = 0;

  static Widget actualPage = Body();

  static void onItemTapped(int index) {
    selectedIndex = index;
    if (index == 0) {
      actualPage = Body();
    } else if (index == 1) {
      actualPage = Profile();
    } else if (index == 2) {
      actualPage = Cart();
    }
  }

  static void onItemTappedProduct(int index, a) {
    Navigator.of(a).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
    selectedIndex = index;
    if (index == 0) {
      actualPage = const Body();
    } else if (index == 1) {
      actualPage = const Profile();
    } else if (index == 2) {
      actualPage = const Cart();
    }
  }

  static void showfavorites(a) {
    actualPage = Favorite();
    Navigator.of(a).push(
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
