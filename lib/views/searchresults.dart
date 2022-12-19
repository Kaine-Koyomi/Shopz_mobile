import 'package:flutter/material.dart';
import 'package:shopz_app/views/item.dart';
import 'package:shopz_app/models/product.dart';
import 'package:shopz_app/views/productDetails.dart';

// ignore: must_be_immutable
class MyshowResults extends StatelessWidget {
  MyshowResults({super.key, required this.results, required this.term});
  var results = <Product>[];
  final String term;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "showing results for \"$term\"... ",
          style: const TextStyle(fontSize: 20),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: results.length,
              itemBuilder: (context, index) => GestureDetector(
                    child: Item(product: results[index]),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            Productdetails(product: results[index]),
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}
