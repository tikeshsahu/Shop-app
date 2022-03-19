import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:kharido_app/widgets/drawer.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_providers.dart';
import 'edit_product_page.dart';

class UserProductsPage extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> refreshProducts(BuildContext context) async{
    await Provider.of<Products>(context,listen: false).fetchAndSetProducts(true);
  }


  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder(
        future: refreshProducts(context),
        builder: (ctx, snapshot) =>  
        snapshot.connectionState == ConnectionState.waiting 
        ? Center(
          child: SpinKitDualRing(
            color: Colors.amber[800],
            size: 40,
          ),
          )
        :  RefreshIndicator(
          onRefresh: () => refreshProducts(context),
          child: Consumer<Products>(
            builder: (ctx, productsData, _) => Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ListView.builder(
                      itemCount: productsData.items.length,
                      itemBuilder: (_, i) => UserProductItem(
                            id: productsData.items[i].id,
                            title: productsData.items[i].title,
                            price: productsData.items[i].price,
                            imageUrl: productsData.items[i].imageUrl,
                          )),
            ),
          ),
        ),
      ),
     bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: () {
             Navigator.of(context).pushNamed(EditProductPage.routeName);
          },
          child: Text(
            'ADD PRODUCT',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          color: Colors.pink[600],
          height: 50,
        ),
      ),
    );
  }
}
