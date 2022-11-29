import 'package:flutter/material.dart';
import 'package:shopz_app/home.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/productDetails.dart';

class Cart extends StatefulWidget {
  Cart({
    super.key,
  });
  static final cartproducts = <Product>[];
  static decquan(a) {
    if (a.quantity <= 1) {
      a.quantity = 0;
      Cart.cartproducts.remove(a);
    } else {
      a.quantity--;
    }
  }

  static acrquan(a) {
    int storage = 10;
    if (a.quantity == storage) {
      const Text("esse produto já tem todo o estoque");
    } else {
      a.quantity++;
    }
  }

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  totalcart(a) {
    double sum = 0;
    for (var i = 0; i < a.length; i++) {
      sum += a[i].price * a[i].quantity;
    }
    return sum;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart(${Cart.cartproducts.length})"),
        backgroundColor: Colors.grey[850],
      ),
      body: Cart.cartproducts.isEmpty
          ? const Center(
              child: Text(
                "não há nada em seu carrinho",
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.cartproducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: Container(
                          color: Colors.grey[200],
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.white,
                                  height: 100,
                                  width: 93,
                                  child: Image.asset(
                                      Cart.cartproducts[index].image),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(Cart.cartproducts[index].title),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => setState(() {
                                      Cart.decquan(Cart.cartproducts[index]);
                                    }),
                                    icon: Icon(Icons.remove),
                                  ),
                                  Text(Cart.cartproducts[index].quantity
                                      .toString()),
                                  IconButton(
                                    onPressed: () => setState(() {
                                      Cart.acrquan(Cart.cartproducts[index]);
                                    }),
                                    icon: Icon(Icons.add),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Productdetails.oCcy
                                      .format(Cart.cartproducts[index].price)
                                      .toString(),
                                ),
                              ),
                              IconButton(
                                  color: Colors.red,
                                  onPressed: () => setState(() {
                                        Cart.cartproducts[index].quantity = 0;
                                        Cart.cartproducts
                                            .remove(Cart.cartproducts[index]);
                                      }),
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 78,
                  alignment: Alignment.center,
                  color: Colors.grey[850],
                  child: Text(
                    "TOTAL \$ ${Productdetails.oCcy.format(totalcart(Cart.cartproducts))}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
