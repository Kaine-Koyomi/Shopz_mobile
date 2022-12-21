import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';

import 'package:shopz_app/models/product.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 129,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 17),
          ),
          Text("\$${Stylization.oCcy.format(product.price)}")
        ],
      ),
    );
  }
}
