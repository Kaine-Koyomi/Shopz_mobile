import 'package:flutter/material.dart';
import 'package:shopz_app/views/login.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "shopz",
      home: Login(),
    );
  }
}
