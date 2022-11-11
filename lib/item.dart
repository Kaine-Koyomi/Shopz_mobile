import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopz_app/model/product.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset("assets/images/hisui.jpg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(product.title),
        )
      ],
    );
  }
}
