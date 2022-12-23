import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopz_app/models/adress_model.dart';
import 'package:shopz_app/models/user_model.dart';
import 'package:shopz_app/repositories/adress_repository.dart';

class AdressController {
  final AdressRepository _repository;
  var fb = FirebaseDatabase.instance;

  String? _street;
  setStreet(value) => _street = value;
  String? _district;
  setDistrict(value) => _district = value;
  String? _number;
  setNumber(value) => _number = value;
  String? _complement;
  setComplement(value) => _complement = value;
  String? _city;
  setCity(value) => _city = value;
  String? _uf;
  setUf(value) => _uf = value;

  Adress? adress;
  AdressController(this._repository);

  Future<bool> fetch(cep) async {
    Adress? a;
    a = await _repository.getAdress(cep);
    if (a.uf != null) {
      adress = a;
      setStreet(a.rua);
      setCity(a.city);
      setComplement(a.complement);
      setNumber(a.number);
      setUf(a.uf);
      setDistrict(a.bairro);

      return true;
    } else {
      return false;
    }
  }

  getUserAdress(value) {
    for (var i = 0; i < users.length; i++) {
      if (users[i].logedin) {
        for (var j = 0; j < users[i].adress.length; j++) {
          switch (value) {
            case "street":
              return users[i].adress[j]!.rua;
            case "bairro":
              return users[i].adress[j]!.bairro;
            case "city":
              return users[i].adress[j]!.city;
            case "uf":
              return users[i].adress[j]!.uf;
          }
        }
      }
    }
  }

  getcontroller(value) {
    switch (value) {
      case "street":
        return TextEditingController(text: adress!.rua);
      case "bairro":
        return TextEditingController(text: adress!.bairro);
      case "city":
        return TextEditingController(text: adress!.city);
      case "uf":
        return TextEditingController(text: adress!.uf);
    }
  }

  setAdress() {
    adress!.rua = _street;
    adress!.city = _city;
    adress!.complement = _complement;
    adress!.bairro = _district;
    adress!.number = _number;
    adress!.uf = _uf;
    confirmAdress();
  }

  Future<bool> confirmAdress() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/${user.uid}/adress");
      await ref.set({
        "street": adress!.rua,
        "district": adress!.bairro,
        "number": adress!.number,
        "complement": adress!.complement,
        "city": adress!.city,
        "uf": adress!.uf
      });
      print(user.uid);
    }
    return false;
  }

  hasAdress() {
    var user = FirebaseAuth.instance.currentUser;
    var ref = fb.ref().child("users/${user!.uid}/adress");

    print(ref);
  }
}
