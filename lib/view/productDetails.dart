// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controller/cart_controller.dart';
import 'package:shopz_app/controller/favorite_controller.dart';
import 'package:shopz_app/controller/navigation_controller.dart';
import 'package:shopz_app/model/favorite_model.dart';
import 'package:shopz_app/view/home.dart';
import 'package:shopz_app/view/item.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/view/profile.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key, required this.product});
  final Product product;
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    Profile.lastseen.add(widget.product);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        backgroundColor: Stylization.appMainColor,
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
                  child: !FavoriteModel.alreadyfav(widget.product)
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              FavoriteController.addFav(widget.product);
                            });
                          },
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              FavoriteController.addFav(widget.product);
                            });
                          },
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )),
              Column(
                children: [
                  Text(
                    "\$${Stylization.oCcy.format(widget.product.price)}",
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
                  onTap: () {
                    setState(() {
                      CartController.addToCart(widget.product, context);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Stylization.appMainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        CartController.alreadyInCart(widget.product)
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
                              style: const TextStyle(
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
                margin: const EdgeInsetsDirectional.only(top: 20),
                decoration: const BoxDecoration(
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
              selectedItemColor: Stylization.appMainColor,
              onTap: ((value) {
                setState(() {
                  NavigatorController.onItemTappedProduct(value, context);
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}
