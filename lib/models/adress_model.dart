import 'package:flutter/foundation.dart';

class Adress {
  String? zipCode;
  String? rua;
  String? bairro;
  String? city;
  String? uf;
  String? complement;
  String? number;

  Adress(this.zipCode, this.rua, this.bairro, this.city, this.uf, this.number,
      this.complement);

  factory Adress.fromJson(Map json) {
    return Adress(json["cep"], json["logradouro"], json["bairro"],
        json["localidade"], json["uf"], null, json["complement"]);
  }
}
