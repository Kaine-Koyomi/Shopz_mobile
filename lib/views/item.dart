import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';

import 'package:shopz_app/models/product.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 129,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        Text(
          product.title,
          style: const TextStyle(fontSize: 17),
        ),
        Text("\$${Stylization.oCcy.format(product.price)}")
      ],
    );
  }
}
