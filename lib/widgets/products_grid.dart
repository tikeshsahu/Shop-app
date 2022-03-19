import 'package:flutter/material.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //builder: (c) => products[i],
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //childAspectRatio: 0.5,
        mainAxisExtent: 355,
        //crossAxisSpacing: 0,
        //mainAxisSpacing: 0,
      ),
    );
  }
}
