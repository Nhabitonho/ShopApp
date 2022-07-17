import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';

import '../providers/cart.dart';
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
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch as Widget,
                value: cart.itemCount.toString(),
                color: Colors.blue,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeNamed);
                },
              ),
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(
          _showOnlyFavorites,
        ));
  }
}
