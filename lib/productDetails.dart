import 'package:flutter/material.dart';
import 'package:shopz_app/model/product.dart';
import 'package:intl/intl.dart';

class Productdetails extends StatelessWidget {
  Productdetails({super.key, required this.product});
  final Product product;
  final oCcy = new NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.grey[850],
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          color: Colors.white,
          height: 200,
          alignment: Alignment.topCenter,
          child: Image.asset(product.image),
        ),
        Text(
          textAlign: TextAlign.start,
          "\$${oCcy.format(product.price)}",
          style: TextStyle(fontSize: 50),
        ),
        Text(
          textAlign: TextAlign.start,
          product.title,
          style: TextStyle(
            fontSize: 48,
          ),
        ),
        Expanded(child: Text(product.description)),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: null,
            child: Container(
              height: 50,
              width: 250,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Text("adicionar ao carrinho"),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
