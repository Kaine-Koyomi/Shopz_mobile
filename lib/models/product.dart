import 'package:firebase_database/firebase_database.dart';

class Product {
  final String title;
  double price;
  String description;
  String image;
  int quantity;
  Product(this.title, this.description, this.price, this.image, this.quantity);

  getProducts() {
    try {
      DatabaseReference products = FirebaseDatabase.instance.ref("products/");
      var list = products.onValue.listen((event) {
        final data = event.snapshot.value as List;
        print(data);
      });
    } catch (e) {
      print(e);
    }
  }

  factory Product.fromJson(Map json) {
    return Product(
        json["title"], json["description"], json["price"], json["image"], 0);
  }
}

List<Product> products = [];
