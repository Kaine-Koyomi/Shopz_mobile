import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/products_controller.dart';
import 'package:shopz_app/views/horizontallist.dart';
import 'package:shopz_app/views/item.dart';
import 'package:shopz_app/models/product.dart';
import 'package:shopz_app/views/productDetails.dart';

class Body extends StatelessWidget {
  Body({super.key});
  ProductController _controller = ProductController();

  @override
  Widget build(BuildContext context) {
    final ref = _controller.fb.ref().child("products");

    return StreamBuilder(
        stream: ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data?.snapshot.value as List;

            products.clear();
            for (var element in list) {
              products.add(Product(element["title"], element["description"],
                  element["price"], element["image"], 0));
            }

            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                color: Colors.grey[850],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(5),
                            bottomStart: Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Shopz",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ZenDots"),
                            ),
                          ),
                          Horizontallist(),
                        ],
                      ),
                    ),
                    Text(
                      "New Products",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(top: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(30),
                            topEnd: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Productdetails(
                                        product: products[index]),
                                  ),
                                );
                              },
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
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
                backgroundColor: Stylization.bodyColor),
          );
        });
  }
}
