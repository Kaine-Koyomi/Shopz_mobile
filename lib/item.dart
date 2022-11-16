import 'package:flutter/material.dart';

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
            width: 129,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.fill,
                )),
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
