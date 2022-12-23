import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/adress_controller.dart';
import 'package:shopz_app/repositories/adress_repository_imp.dart';

class Adressinfo extends StatefulWidget {
  const Adressinfo({super.key});

  @override
  State<Adressinfo> createState() => _AdressinfoState();
}

class _AdressinfoState extends State<Adressinfo> {
  final AdressController _controller = AdressController(AdressRepositoryImp());
  TextEditingController textController =
      TextEditingController(text: "Initial Text");

  @override
  bool _cep = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Stylization.appMainColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Shipment Info",
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Zip code"),
              ),
              onSubmitted: (value) async {
                var o = await _controller.fetch(value);
                setState(() {
                  if (o) {
                    _cep = true;
                  } else {
                    _cep = false;
                  }
                });
              },
            ),
            _cep
                ? Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(label: Text("Street")),
                        controller: _controller.getcontroller("street"),
                        onChanged: (value) {
                          _controller.setStreet(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("Number")),
                        onChanged: (value) {
                          _controller.setNumber(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("District")),
                        controller: _controller.getcontroller("bairro"),
                        onChanged: (value) {
                          _controller.setDistrict(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("Complement")),
                        onChanged: (value) {
                          _controller.setComplement(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("City")),
                        controller: _controller.getcontroller("city"),
                        onChanged: (value) {
                          _controller.setCity(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("UF")),
                        controller: _controller.getcontroller("uf"),
                        onChanged: (value) {
                          _controller.setUf(value);
                        },
                      ),
                    ],
                  )
                : Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(label: Text("Street")),
                        onChanged: (value) {
                          _controller.setStreet(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("Number")),
                        onChanged: (value) {
                          _controller.setNumber(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("District")),
                        onChanged: (value) {
                          _controller.setDistrict(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("Complement")),
                        onChanged: (value) {
                          _controller.setComplement(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("City")),
                        onChanged: (value) {
                          _controller.setCity(value);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(label: Text("UF")),
                        onChanged: (value) {
                          _controller.setUf(value);
                        },
                      ),
                    ],
                  ),
            ElevatedButton(
                onPressed: () {
                  _controller.hasAdress();
                  _controller.setAdress();
                },
                child: Text("Save Adress"))
          ],
        ),
      ),
    );
  }
}
