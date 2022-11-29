import 'package:flutter/material.dart';
import 'package:shopz_app/horizontallist.dart';
import 'package:shopz_app/item.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/productDetails.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome to Shopz",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Horizontallist(),
          Text(
            "New Products",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: SizedBox(
              height: 900,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            Productdetails(product: products[index]),
                      ),
                    ),
                    child: Item(
                      product: products[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
