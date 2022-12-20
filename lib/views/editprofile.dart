import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/adress_controller.dart';
import 'package:shopz_app/controllers/user_controller.dart';
import 'package:shopz_app/repositories/adress_repository_imp.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  AdressController _controller = AdressController(AdressRepositoryImp());
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Stylization.appMainColor,
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            label: Text("Name"),
          ),
          controller: _userController.getcontroller("name"),
        ),
        TextField(
          decoration: InputDecoration(
            label: Text("Email"),
          ),
          controller: _userController.getcontroller("login"),
        ),
      ]),
    );
  }
}
