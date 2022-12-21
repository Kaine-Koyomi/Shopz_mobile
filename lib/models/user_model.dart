import 'package:firebase_database/firebase_database.dart';
import 'package:shopz_app/models/adress_model.dart';

class UserModel {
  String? name;
  String? login;
  String? pass;
  List<Adress?> adress;
  bool logedin;

  UserModel(this.login, this.pass, this.adress, this.name, this.logedin);
}

List<UserModel> users = [
  UserModel("login", "pass", [], "Mauricio", false),
  UserModel("mau", "1234", [], "Angelica", false),
];
