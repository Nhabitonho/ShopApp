import 'package:flutter/material.dart';

import '../providers/product.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MySShop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectvalue) {
                setState(() {
                  if (selectvalue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                )
              ],
              icon: Icon(
                Icons.more_vert,
              ),
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ProductsGrid(
          _showOnlyFavorites,
        ));
  }
}
