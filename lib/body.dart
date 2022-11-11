import 'package:flutter/widgets.dart';
import 'package:shopz_app/horizontallist.dart';
import 'package:shopz_app/item.dart';
import 'package:shopz_app/model/product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Horizontallist(),
        Expanded(
            child: SizedBox(
          height: 900,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => Item(
                    product: products[index],
                  )),
        ))
      ],
    );
  }
}
