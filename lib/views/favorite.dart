import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/favorite_controller.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Stylization.bodyColor,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Favorites(${FavoriteController.count()})",
                style: TextStyle(
                  fontSize: 18,
                  color: Stylization.fontColorWhite,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: FavoriteController.count(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            height: 100,
                            width: 93,
                            child: Image.network(
                                FavoriteController.favConsult(index, "image")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 99,
                            child: Text(
                              FavoriteController.favConsult(index, "title"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "\$ ${Stylization.oCcy.format(FavoriteController.favConsult(index, "price")).toString()}"),
                        ),
                        IconButton(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            onPressed: () => setState(() {
                                  FavoriteController.removeFromFav(index);
                                }),
                            icon: const Icon(Icons.cancel)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
