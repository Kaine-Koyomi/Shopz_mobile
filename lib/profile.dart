import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopz_app/favorite.dart';
import 'package:shopz_app/home.dart';
import 'package:shopz_app/item.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/productDetails.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static final lastseen = <Product>[];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    void showfavorites() {
      Homestate.actualpage = Favorite();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber[900],
                  image: const DecorationImage(
                    image:
                        AssetImage("assets/images/default-profile-photo.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 100,
                width: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "username",
                  style: TextStyle(
                    fontSize: 29,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: showfavorites,
                child: Container(
                  height: 50,
                  width: 170,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text(
                        "Favorites",
                        style: TextStyle(fontFamily: "anton", fontSize: 29),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "last product seen",
              style: TextStyle(fontFamily: "anton", fontSize: 29),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 200,
              ),
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Productdetails(product: products[index]),
                    ),
                  ),
                  child: Profile.lastseen.isEmpty
                      ? Container(
                          width: 100,
                          color: Colors.grey[200],
                        )
                      : Container(
                          width: 100,
                          color: Colors.grey[200],
                          child: Item(
                            product: Profile.lastseen.last,
                          ),
                        ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
