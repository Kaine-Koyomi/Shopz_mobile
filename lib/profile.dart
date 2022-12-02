// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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

    return Container(
      color: Colors.grey[850],
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            margin: EdgeInsetsDirectional.only(bottom: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber[900],
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/default-profile-photo.jpg"),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
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
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "last product seen",
                    style: TextStyle(fontFamily: "anton", fontSize: 29),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                color: Colors.white,
                              )
                            : Container(
                                child: Item(
                                  product: Profile.lastseen.last,
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
