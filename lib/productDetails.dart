import 'package:flutter/material.dart';
import 'package:shopz_app/cart.dart';
import 'package:shopz_app/model/product.dart';
import 'package:intl/intl.dart';

class Productdetails extends StatefulWidget {
  Productdetails({super.key, required this.product});
  final Product product;
  static final oCcy = new NumberFormat("#,##0.00", "pt_BR");
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    final alreadySaved = Cart.cartproducts.contains(widget.product);
    void _showcart() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Cart()),
      );
    }

    addtocart() {
      setState(() {
        if (alreadySaved) {
          _showcart();
        } else {
          widget.product.quantity++;
          Cart.cartproducts.add(widget.product);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Cart()),
            ),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          children: [
            Text(
              textAlign: TextAlign.start,
              widget.product.title,
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
        Container(
          color: Colors.white,
          height: 200,
          alignment: Alignment.topCenter,
          child: Image.asset(widget.product.image),
        ),
        Row(
          children: [
            Text(
              "\$${Productdetails.oCcy.format(widget.product.price)}",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: addtocart,
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  alreadySaved
                      ? Text("ver no carrinho")
                      : Text("adicionar ao carrinho")
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 150,
                child: ListView(
                  children: [
                    Text(
                      widget.product.description,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
