import 'package:flutter/material.dart';
import 'package:shopz_app/models/adress_model.dart';
import 'package:shopz_app/models/user_model.dart';
import 'package:shopz_app/repositories/adress_repository.dart';

class AdressController {
  final AdressRepository _repository;

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

      return true;
    } else {
      return false;
    }
  }

  getUserAdress(value) {
    for (var i = 0; i < users.length; i++) {
      if (users[i].logedin) {
        switch (value) {
          case "street":
            return users[i].adress!.rua;
          case "bairro":
            return users[i].adress!.bairro;
          case "city":
            return users[i].adress!.city;
          case "uf":
            return users[i].adress!.uf;
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
    for (var i = 0; i < users.length; i++) {
      if (users[i].logedin) {
        print(users[i].adress!.number);
        users[i].adress = adress;
        return true;
      }
    }
    return false;
  }
}
