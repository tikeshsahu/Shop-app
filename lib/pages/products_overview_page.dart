import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kharido_app/pages/cart_page.dart';
import 'package:kharido_app/pages/product_detail_page.dart';
import 'package:kharido_app/providers/cart.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:kharido_app/widgets/badge.dart';
import 'package:kharido_app/widgets/drawer.dart';
import 'package:kharido_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../providers/product.dart';
import 'persons.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewPage extends StatefulWidget {
  static const routeName = '/product-overview';

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  var showOnlyFavorites = false;
  var isInit = true;
  var isLoading = false;

  List<Product> productsList() {
    return Provider.of<Products>(context, listen: false).items;
  }

  @override
  void initState() {
    //  Provider.of<Products>(context,listen: false).fetchAndSetProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Products>(context, listen: false).findByTitle(title);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Color(0xFF1328A4),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    showOnlyFavorites = true;
                  } else {
                    showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    )
                  ]),
          // Consumer<Cart>(
          //   builder: (_, cart, ch) => Badge(
          //     child: ch,
          //     value: cart.itemCount.toString(),
          //   ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: isLoading
            ? Center(
                child: SpinKitDualRing(size: 40, color: Colors.amber[800]),
              )
            : ProductsGrid(showOnlyFavorites),
      ),
      ////

      floatingActionButton: Consumer<Products>(
        builder: (context, value, child) => FloatingActionButton(
          child: Icon(Icons.search),
          tooltip: 'Search Products',
          onPressed: () => showSearch(
            context: context,
            //query: 'aabbccdd',
            delegate: SearchPage<Product>(
              itemStartsWith: true,
              items: productsList(),
              searchLabel: 'Search Products',
              suggestion: Center(
                child: Text('Search by Name or Category'),
              ),
              failure: Center(
                child: Text('No products found :('),
              ),
              filter: (product) => [
                product.title,product.category,
              ],
              builder: (product) => GestureDetector(
                child: ListTile(
                  title: Text(product.title),
                  trailing: Container(
                    height: 60,
                    width: 60,
                    child: Image.network(product.imageUrl),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ProductDetailPage.routeName,arguments: product.id);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
