import 'package:flutter/material.dart';
import 'package:shopz_app/commons/styles.dart';
import 'package:shopz_app/controllers/cart_controller.dart';
import 'package:shopz_app/controllers/navigation_controller.dart';
import 'package:shopz_app/views/adressinfo.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartController.cartConsult(0, "empty")
          ? Container(
              color: Stylization.bodyColor,
              child: const Center(
                child: Text(
                  "your shopping cart is empty",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Container(
              color: Colors.grey[850],
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "you have ${CartController.cartConsult(0, "count")} item in your Cart",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: CartController.cartConsult(0, "count"),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, bottom: 8),
                                  child: Container(
                                    color: Colors.white,
                                    height: 100,
                                    width: 93,
                                    child: Image.network(
                                      CartController.cartConsult(
                                          index, "image"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    width: 40,
                                    child: Text(
                                      CartController.cartConsult(
                                          index, "title"),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => setState(() {
                                        CartController.decquan(index);
                                      }),
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(CartController.cartConsult(
                                            index, "quantity")
                                        .toString()),
                                    IconButton(
                                      onPressed: () => setState(() {
                                        CartController.acrquan(index);
                                      }),
                                      icon: const Icon(Icons.add),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      "\$${Stylization.oCcy.format(CartController.cartConsult(index, "price")).toString()}"),
                                ),
                                IconButton(
                                    color: Colors.red,
                                    onPressed: () => setState(() {
                                          CartController.removeFromCart(index);
                                        }),
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOTAL \$ ${Stylization.oCcy.format(CartController.totalCart())}",
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigatorController.goToPage(Adressinfo(), context);
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Stylization.appMainColor,
                            ),
                            child: Center(
                                child: Text(
                              "finish order",
                              style:
                                  TextStyle(color: Stylization.fontColorWhite),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
