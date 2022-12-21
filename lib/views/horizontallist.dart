import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/controllers/products_controller.dart';
import 'package:shopz_app/models/product.dart';
import 'package:shopz_app/views/productDetails.dart';

class Horizontallist extends StatelessWidget {
  Horizontallist({super.key});
  ProductController _controller = ProductController();

  @override
  Widget build(BuildContext context) {
    final ref = _controller.fb.ref().child("products");
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 50),
      height: 200,
      child: FirebaseAnimatedList(
        scrollDirection: Axis.horizontal,
        query: ref,
        itemBuilder: (context, snapshot, animation, index) {
          var a = snapshot.value as Map;
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Productdetails(product: products[index]),
                ),
              );
            },
            child: Container(
              height: 600,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(a["image"]),
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
