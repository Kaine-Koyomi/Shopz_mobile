// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopz_app/body.dart';
import 'package:shopz_app/cart.dart';
import 'package:shopz_app/mysearchdelegate.dart';
import 'package:shopz_app/profile.dart';
import 'package:shopz_app/sidebar.dart';
import 'package:shopz_app/favorite.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static var selectedIndex = 0;
  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Homestate extends State {
  static Widget actualpage = Body();

  void _onItemTapped(int index) {
    setState(() {
      Home.selectedIndex = index;
      if (index == 0) {
        actualpage = Body();
      } else if (index == 1) {
        actualpage = Profile();
      } else if (index == 2) {
        actualpage = Cart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('shopz'),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: MysearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.grey[850],
      ),
      body: actualpage,
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
              currentIndex: Home.selectedIndex,
              selectedItemColor: Colors.blue[800],
              onTap: _onItemTapped,
            ),
          )
        ],
      ),
    );
  }
}
