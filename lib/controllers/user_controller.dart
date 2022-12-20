import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  snackBar(String mensage) => SnackBar(
        content: Text(mensage),
      );

  Future<String> signIn(a) async {
    try {
      if (_login == null || _pass == null) {
        return "fill all camps please";
      } else {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _login!, password: _pass!);
        isLoggedin(a);
        return "logged in with success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    return "values are not valid";
  }

  isLoggedin(a) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        Navigator.of(a).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(),
        ));
      }
    });
  }

  getUserData() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.displayName;
    }
  }

  updatename() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updateDisplayName(_newname);
    }
  }

  Future<String> register(a) async {
    if (_confirmpass == _newpass && _newname != null) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _newlogin!,
          password: _newpass!,
        );
        updatename();
        isLoggedin(a);
        return "registered with success, welcome";
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        }
      } catch (e) {
        return ('$e');
      }
    } else {
      return "the two passwords must be equals";
    }
    return "values are not valid";
  }

  getcontroller(value) {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      switch (value) {
        case "name":
          return TextEditingController(text: user.displayName);
        case "login":
          return TextEditingController(text: user.email);
      }
    }
  }
}
