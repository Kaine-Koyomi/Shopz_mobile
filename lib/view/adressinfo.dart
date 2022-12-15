import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopz_app/commons/styles.dart';

class Adressinfo extends StatelessWidget {
  const Adressinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Stylization.appMainColor),
      body: Column(
        children: [
          Text("add your adress info"),
          TextField(
            decoration: InputDecoration(
              label: Text("Zip code"),
            ),
          ),
          TextField(
            decoration: InputDecoration(label: Text("Street")),
          )
        ],
      ),
    );
  }
}
