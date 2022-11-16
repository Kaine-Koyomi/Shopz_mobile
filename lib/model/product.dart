class Product {
  final String title;
  double price;
  String description;
  String image;
  Product(this.title, this.description, this.price, this.image);
}

List<Product> products = [
  Product("teste", "descrição", 10.2, "assets/images/arc.jpeg"),
  Product("opa", "produto muito foda", 20, "assets/images/shiki.jpg"),
  Product("hisui", "produto muito pika", 10.22, "assets/images/hisui.jpg"),
  Product("teste", "descrição", 10.2, "assets/images/hisui.jpg"),
  Product("opa", "produto muito foda", 20, "assets/images/images.jpeg"),
  Product("hisui", "produto muito pika", 10.22, "assets/images/produto.jpeg"),
  Product("teste", "descrição", 10.2, "assets/images/caixa.jpeg"),
  Product("opa", "produto muito foda", 20, "assets/images/maxresdefault.jpg"),
  Product("hisui", "produto muito pika", 10.22,
      "assets/images/filme_do_mario_primeiro_poster.jpeg")
];
