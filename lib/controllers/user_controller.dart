import 'package:flutter/material.dart';
import 'package:shopz_app/models/user_model.dart';
import 'package:shopz_app/views/home.dart';

class UserController {
  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  String? _newname;
  setName(String value) => _newname = value;
  String? _newlogin;
  setNLogin(String value) => _newlogin = value;
  String? _newpass;
  setNPass(String value) => _newpass = value;
  String? _confirmpass;
  setNConfPass(String value) => _confirmpass = value;

  snackBar(message) => SnackBar(
        content: Text('$message'),
      );

  auth(a) {
    for (var i = 0; i < users.length; i++) {
      if (_login == users[i].login && _pass == users[i].pass) {
        Navigator.of(a).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
        users[i].logedin = true;
        return true;
      }
    }
    return false;
  }

  getUserData(value) {
    for (var i = 0; i < users.length; i++) {
      if (users[i].logedin) {
        switch (value) {
          case "name":
            return users[i].name;
        }
      }
    }
  }

  register() {
    if (_confirmpass == _newpass) {
      users.add(
        UserModel(_newlogin, _newpass, null, _newname, false),
      );
      return true;
    } else {
      return false;
    }
  }
}
