import 'dart:ffi';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/adress_controller.dart';
import 'package:shopz_app/controllers/navigation_controller.dart';
import 'package:shopz_app/controllers/user_controller.dart';
import 'package:shopz_app/repositories/adress_repository_imp.dart';
import 'package:shopz_app/views/adressinfo.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AdressController _controller = AdressController(AdressRepositoryImp());

  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var db = _userController.fb.ref().child("users/${user!.uid}/adress");

    return StreamBuilder(
        stream: db.onValue,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            Map map = {};
            try {
              map = snapshot.data?.snapshot.value as Map;
            } catch (e) {
              print(e);
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Stylization.appMainColor,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
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
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (await _userController.pickfile()) {
                                setState(() {
                                  _userController.uploadFile();
                                });
                              }
                            },
                            child: Text("choose photo"))
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Name"),
                      ),
                      onSubmitted: (value) {
                        _userController.setName(value);
                        _userController.updatename();
                      },
                      controller: _userController.getcontroller("name"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                      ),
                      readOnly: true,
                      controller: _userController.getcontroller("login"),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "My last orders",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 130,
                      padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: Column(children: [
                        Text(
                          "Adresses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 29),
                        ),
                        Text(
                          map.isEmpty
                              ? "you dont have any adress registred"
                              : "${map["street"]}, ${map["number"]}, ${map["district"]}, ${map["city"]} - ${map["uf"]}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigatorController.goToPage(Adressinfo(), context);
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ]),
                    ),
                  ]),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
