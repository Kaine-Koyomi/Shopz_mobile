// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopz_app/body.dart';

class Home extends StatefulWidget {
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
            title: Text('shopz'),
            actions: [IconButton(onPressed: null, icon: Icon(Icons.search))],
            backgroundColor: Colors.grey[850]),
        body: Body());
  }
}
