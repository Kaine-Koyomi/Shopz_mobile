import 'package:flutter/material.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/view/productDetails.dart';

class Horizontallist extends StatelessWidget {
  const Horizontallist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 50),
      height: 200,
      child: ListView.builder(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Productdetails(product: products[index]),
              ),
            ),
            child: Container(
              height: 600,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(products[index].image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
