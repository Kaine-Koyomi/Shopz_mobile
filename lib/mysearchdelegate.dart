import 'package:flutter/material.dart';
import 'package:shopz_app/model/product.dart';
import 'package:shopz_app/searchresults.dart';

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
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return MyshowResults(
      results: resul(),
      term: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
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
