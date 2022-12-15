import 'dart:ffi';

import 'package:shopz_app/model/adress_model.dart';

class UserModel {
  final String? name;
  final String? login;
  final String? pass;
  final Adress? adress;
  bool logedin;

  UserModel(this.login, this.pass, this.adress, this.name, this.logedin);
}

List<UserModel> users = [
  UserModel("login", "pass", null, "Mauricio", false),
  UserModel("mau", "1234", null, "Angelica", false),
];
