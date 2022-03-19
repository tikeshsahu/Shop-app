import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/pages/cart_page.dart';
import 'package:kharido_app/pages/products_overview_page.dart';
import 'package:kharido_app/providers/auth.dart';
import 'package:kharido_app/providers/cart.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:kharido_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final authData = Provider.of<Auth>(context, listen: false);

    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //brightness: Brightness.light,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            iconSize: 28,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                loadedProduct.toggleFavoriteStatus(
                    authData.token, authData.userId);
              });
            },
            icon: Icon(
              loadedProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            iconSize: 28,
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(CartPage.routeName);
            },
            icon: Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            color: Colors.white,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(ProductOverviewPage.routeName);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 28,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                    height: 565,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          loadedProduct.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                              fontFamily: GoogleFonts.stoke().fontFamily),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        loadedProduct.description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '\$ ${loadedProduct.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('${loadedProduct.discount} %  OFF',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Inclusive of All Taxes',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Divider(
                    thickness: 10,
                    color: Colors.grey[225],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 4,),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'EMI Option Available',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View Plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.red[700]),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Text('EMI Starting from Rs. 50/Month'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Easy 30 days Return and Exchange',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                            'Choose to Return or Exchange for a different Size within 30 days.'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: () {
            setState(() {
              cart.addItem(loadedProduct.id, loadedProduct.price,
                  loadedProduct.title, loadedProduct.imageUrl);
              
            });
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Item Added to Cart'),
                duration: Duration(seconds: 2),
              ));
          },
          child: Text(
            'ADD TO BAG',
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
