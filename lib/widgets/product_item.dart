import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/providers/auth.dart';
import '../pages/product_detail_page.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailPage.routeName,
                  arguments: product.id);
            },
            child: Stack(
              children: [
                Card(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            height: 242,
                            width: 200,
                          ),
                          IconButton(
                              iconSize: 32,
                              onPressed: () {
                                product.toggleFavoriteStatus(authData.token,authData.userId);
                              },
                              icon: Icon(
                                product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              )),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text(
                                      product.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                          fontFamily:
                                              GoogleFonts.stoke().fontFamily),
                                    ),
                                    //color: Colors.black,
                                    height: 21,
                                    width: 120,
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Text(
                                //     product.title,
                                //     overflow: TextOverflow.ellipsis,
                                // style: TextStyle(
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.bold,
                                //     color: Colors.grey[700],
                                //     fontFamily:
                                //         GoogleFonts.stoke().fontFamily),
                                //   ),
                                // ),

                                IconButton(
                                    onPressed: () {
                                      cart.addItem(product.id, product.price,
                                          product.title, product.imageUrl);
                                      Scaffold.of(context)
                                          .hideCurrentSnackBar();
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Item Added to Cart'),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'UNDO',
                                          onPressed: () {
                                            cart.removeByUndo(product.id);
                                          },
                                        ),
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.cyan,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  child: Text(product.description,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[500],
                                          fontSize: 13)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 7),
                                  child: Text(
                                    '\$ ${product.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: GoogleFonts.arimaMadurai()
                                            .fontFamily),
                                  ),
                                ),
                                Container(
                                  width: 4,
                                  color: Colors.transparent,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${product.discount} %  OFF',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.arimaMadurai().fontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
