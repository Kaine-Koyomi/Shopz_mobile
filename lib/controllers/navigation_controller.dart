import 'package:flutter/material.dart';
import 'package:shopz_app/views/body.dart';
import 'package:shopz_app/views/cart.dart';
import 'package:shopz_app/views/favorite.dart';
import 'package:shopz_app/views/home.dart';
import 'package:shopz_app/views/profile.dart';

class NavigatorController {
  static var selectedIndex = 0;

  static Widget actualPage = const Body();

  static void onItemTapped(int index) {
    selectedIndex = index;
    if (index == 0) {
      actualPage = const Body();
    } else if (index == 1) {
      actualPage = const Profile();
    } else if (index == 2) {
      actualPage = const Cart();
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
    actualPage = const Favorite();
    Navigator.of(a).push(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  static goToPage(page, a) {
    Navigator.of(a).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
