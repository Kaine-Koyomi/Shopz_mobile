import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopz_app/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "shopz",
      home: Login(),
    );
  }
}
