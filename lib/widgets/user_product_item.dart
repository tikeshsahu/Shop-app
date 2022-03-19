import 'package:flutter/material.dart';
import 'package:kharido_app/providers/product.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:provider/provider.dart';
import '../pages/edit_product_page.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  const UserProductItem({this.id, this.title, this.price, this.imageUrl});

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
                          child: Text('NO',
                              style: TextStyle(color: Colors.amber[800]))),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(color: Colors.amber[800]),
                          ))
                    ],
                  ));
        },
        onDismissed: (direction) {
          Provider.of<Products>(context, listen: false).deleteProduct(id);
        },
        child: GestureDetector(
            child: Card(
          child: Column(
            children: [
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
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$ $price',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        color: Colors.black,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                EditProductPage.routeName,
                                arguments: id);
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ],
              )
            ],
          ),
        )
            //     ListTile(
            //   title: Text(title),
            //   leading: CircleAvatar(
            //     backgroundImage: NetworkImage(imageUrl),
            //   ),
            //   trailing: IconButton(
            //       onPressed: () {
            // Navigator.of(context)
            //     .pushNamed(EditProductPage.routeName, arguments: id);
            //       },
            //       icon: Icon(Icons.edit)),
            // )
            ));
  }
}
