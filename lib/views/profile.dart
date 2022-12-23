// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/navigation_controller.dart';
import 'package:shopz_app/controllers/user_controller.dart';
import 'package:shopz_app/views/editprofile.dart';
import 'package:shopz_app/views/item.dart';
import 'package:shopz_app/models/product.dart';
import 'package:shopz_app/views/productDetails.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static final lastseen = <Product>[];
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final UserController _controller = UserController();
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var ref = _controller.fb.ref().child("users/${user!.uid}/image");

    return Container(
      color: Stylization.bodyColor,
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
                  (imageurl.isEmpty)
                      ? Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/default-profile-photo.jpg"),
                              )))
                      : Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.network(imageurl.last)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _controller.getUserData()!,
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
                  onTap: () {
                    NavigatorController.showfavorites(context);
                  },
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
              GestureDetector(
                onTap: () {
                  NavigatorController.goToPage(EditProfile(), context);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.edit,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(fontFamily: "anton", fontSize: 29),
                      ),
                    ],
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Productdetails(product: products[index]),
                            ),
                          );
                        },
                        child: Profile.lastseen.isEmpty
                            ? Container(
                                color: Colors.white,
                              )
                            : Item(
                                product: Profile.lastseen.last,
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
