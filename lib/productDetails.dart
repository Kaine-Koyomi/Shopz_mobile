import 'package:flutter/material.dart';
import 'package:shopz_app/body.dart';
import 'package:shopz_app/cart.dart';
import 'package:shopz_app/favorite.dart';
import 'package:shopz_app/home.dart';
import 'package:shopz_app/item.dart';
import 'package:shopz_app/model/product.dart';
import 'package:intl/intl.dart';
import 'package:shopz_app/profile.dart';

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
    final alreadyfav = Favorite.productsfav.contains(widget.product);
    Profile.lastseen.add(widget.product);
    void _showcart() {
      Homestate.actualpage = Cart();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()),
      );
    }

    addfav() {
      setState(() {
        if (alreadyfav) {
          Favorite.productsfav.remove(widget.product);
        } else {
          Favorite.productsfav.add(widget.product);
        }
      });
    }

    void _onItemTapped(int index) {
      setState(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
        Home.selectedIndex = index;
        if (index == 0) {
          Homestate.actualpage = Body();
        } else if (index == 1) {
          Homestate.actualpage = Profile();
        } else if (index == 2) {
          Homestate.actualpage = Cart();
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
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          color: Colors.grey[850],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    widget.product.title,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(widget.product.image),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: !alreadyfav
                      ? GestureDetector(
                          onTap: addfav,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        )
                      : GestureDetector(
                          onTap: addfav,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )),
              Column(
                children: [
                  Text(
                    "\$${Productdetails.oCcy.format(widget.product.price)}",
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
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
                      color: Colors.blue[800],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        alreadySaved
                            ? const Text(
                                "see in the cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
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
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20),
                    topStart: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
            ],
          ),
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
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
              currentIndex: Home.selectedIndex,
              selectedItemColor: Colors.blue[800],
              onTap: _onItemTapped,
            ),
          )
        ],
      ),
    );
  }
}
