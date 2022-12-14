import 'package:flutter/material.dart';
import 'view/home.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "shopz",
      home: Home(),
    );
  }
}
