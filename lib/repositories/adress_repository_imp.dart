import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopz_app/models/adress_model.dart';
import 'package:shopz_app/repositories/adress_repository.dart';

class AdressRepositoryImp extends AdressRepository {
  @override
  Future<Adress> getAdress(cep) async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
      var decodedResponse = jsonDecode(response.body) as Map;
      return await Adress.fromJson(decodedResponse);
    } catch (e) {
      print(e);
      return Adress(null, null, null, null, null, null, null);
    } finally {
      client.close();
    }
  }
}
