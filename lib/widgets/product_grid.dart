import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import 'Product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  // final bool showFavs;
  // ProductsGrid({required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
      context,
    );
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
    );
  }
}
