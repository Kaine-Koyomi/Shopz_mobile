import 'package:flutter/material.dart';
import 'package:shopz_app/mongodb.dart';

import './home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDataBase.connect();
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
