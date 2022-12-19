import 'package:shopz_app/models/adress_model.dart';

abstract class AdressRepository {
  Future<Adress> getAdress(cep);
}
