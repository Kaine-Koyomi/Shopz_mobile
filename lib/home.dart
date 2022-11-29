// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopz_app/body.dart';
import 'package:shopz_app/cart.dart';
import 'package:shopz_app/mysearchdelegate.dart';
import 'package:shopz_app/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Homestate extends State {
  static int _selectedIndex = 0;

  Widget actualpage = Body();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        actualpage = Body();
      } else if (index == 1) {
        actualpage = Profile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          IconButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Cart()),
            ),
            icon: Icon(Icons.shopping_cart),
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
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue[800],
              onTap: _onItemTapped,
            ),
          )
        ],
      ),
    );
  }
}
