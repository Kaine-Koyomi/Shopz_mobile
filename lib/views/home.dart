// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/mysearchdelegate.dart';
import 'package:shopz_app/controllers/navigation_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static var selectedIndex = 0;
  @override
  State<StatefulWidget> createState() {
    return Homestate();
  }
}

class Homestate extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: MysearchDelegate());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                margin: EdgeInsetsDirectional.only(end: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: Text(
                        "search for products",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[500]),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          showSearch(
                              context: context, delegate: MysearchDelegate());
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Stylization.appMainColor,
      ),
      body: NavigatorController.actualPage,
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
              currentIndex: NavigatorController.selectedIndex,
              selectedItemColor: Stylization.appMainColor,
              onTap: ((value) {
                setState(() {
                  NavigatorController.onItemTapped(value);
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}
