import 'package:flutter/material.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/view/searchresults.dart';

class MysearchDelegate extends SearchDelegate {
  resul() {
    final a = <Product>[];
    for (int i = 0; i <= products.length - 1; i++) {
      if (query == products[i].title) {
        a.add(products[i]);
      } else {
        continue;
      }
    }

    return a;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return MyshowResults(
      results: resul(),
      term: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestions = products.where(
      (element) {
        final result = element.title.toLowerCase();
        final input = query.toLowerCase();

        return result.contains(input);
      },
    ).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestions[index].title;
          showResults(context);
        },
        title: Text(suggestions[index].title),
      ),
    );
  }
}
