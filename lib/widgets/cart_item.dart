import 'package:flutter/material.dart';
import 'package:kharido_app/pages/product_detail_page.dart';
import 'package:kharido_app/providers/cart.dart';
import 'package:kharido_app/providers/product.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;
  const CartItems(
      {this.id,
      this.imageUrl,
      this.productId,
      this.price,
      this.quantity,
      this.title});
      
    

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.all(8),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you Sure ?'),
                  content: Text('Pakka Delete Kardu ?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('NO',style: TextStyle(color: Colors.amber[800]))),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      }, 
                      child: Text('YES',style: TextStyle(color: Colors.amber[800]),))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItems(productId);
      },
      child: GestureDetector(
        // onTap: () {
        //    Navigator.of(context).pushNamed(ProductDetailPage.routeName,
        //            arguments:  Provider.of<Products>(context, listen: false).findById(productId));
        // },
        child: Card(
          
          
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 85,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Size:  M',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        Container(
                          width: 140,
                          color: Colors.black,
                        ),
                        Text('Quantity:   x $quantity',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
