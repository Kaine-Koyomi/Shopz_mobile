import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/productDetails.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});
  static final productsfav = <Product>[];
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Favorites(${Favorite.productsfav.length})",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: Favorite.productsfav.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Container(
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          height: 100,
                          width: 93,
                          child: Image.asset(Favorite.productsfav[index].image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 99,
                            child: Text(Favorite.productsfav[index].title)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "\$ ${Productdetails.oCcy.format(Favorite.productsfav[index].price).toString()}"),
                      ),
                      IconButton(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          onPressed: () => setState(() {
                                Favorite.productsfav
                                    .remove(Favorite.productsfav[index]);
                              }),
                          icon: Icon(Icons.cancel)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
