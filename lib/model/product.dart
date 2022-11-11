import 'dart:ffi';

class Product {
  String title;
  double price;
  String description;

  Product(this.title, this.description, this.price);
}

List<Product> products = [
  Product("teste", "descrição", 10.2),
  Product("opa", "produto muito foda", 20),
  Product("hisui", "produto muito pika", 10.22),
  Product("teste", "descrição", 10.2),
  Product("opa", "produto muito foda", 20),
  Product("hisui", "produto muito pika", 10.22),
  Product("teste", "descrição", 10.2),
  Product("opa", "produto muito foda", 20),
  Product("hisui", "produto muito pika", 10.22)
];
