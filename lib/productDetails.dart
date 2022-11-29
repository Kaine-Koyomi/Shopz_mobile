import 'package:flutter/material.dart';
import 'package:shopz_app/cart.dart';
import 'package:shopz_app/item.dart';
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

    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if (index == 0 || index == 1) {
          Navigator.pop(context);
        }
      });
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
                          ? Text("see in the cart")
                          : Text("add to cart")
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                "Suggestions",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: SizedBox(
                height: 800,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Productdetails(product: products[index]),
                        ),
                      ),
                      child: Item(
                        product: products[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue[800],
              onTap: _onItemTapped,
            ),
          )
        ],
      ),
    );
  }
}
