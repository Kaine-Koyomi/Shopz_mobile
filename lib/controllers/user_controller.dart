import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/views/home.dart';

class UserController {
  final fb = FirebaseDatabase.instance;
  final storageRef = FirebaseStorage.instance.ref();

  FilePickerResult? result;
  PlatformFile? pickedphoto;

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

  setInDb() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${user.uid}");
      await ref.set({
        "email": _newlogin,
        "name": _newname,
        "image": "",
      });
    }
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
    var ref = fb.ref().child("users/${user!.uid}");
    if (user != null) {
      await user.updateDisplayName(_newname);
      await ref.update({"name": _newname});
    }
  }

  updatephoto() async {
    var user = FirebaseAuth.instance.currentUser;
    var ref = fb.ref().child("users/${user!.uid}");
    if (user != null) {
      await ref.update({"image": pickedphoto!.name});
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
        setInDb();
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

  Future uploadFile() async {
    final user = FirebaseAuth.instance.currentUser;
    final path = "profilepic/${user!.uid}/profilephoto";
    final file = File(pickedphoto!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future<bool> pickfile() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return false;
    }

    pickedphoto = result!.files.first;
    return true;
  }

  static Future getFile() async {
    final user = FirebaseAuth.instance.currentUser;
    final ref = FirebaseStorage.instance
        .ref()
        .child("profilepic/${user!.uid}/profilephoto");
    try {
      imageurl.add(await ref.getDownloadURL());
    } catch (e) {
      var defaultref = FirebaseStorage.instance
          .ref()
          .child("profilepic/default-profile-photo.jpg");
      print(e);
      imageurl.add(await defaultref.getDownloadURL());
    }

    if (imageurl.length > 1) {
      imageurl.removeAt(0);
    } else {
      return;
    }

    return imageurl.first;
  }
}

List<String> imageurl = [];
