import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart' as ci;
import '../providers/product.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';

import 'orders_page.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersPage.routeName);
              },
              icon: Icon(Icons.playlist_add_check))
        ],
        backgroundColor: Color(0xFF1328A4),
      ),
      body:
          //  Consumer<Product>(
          //    builder: (context, value, child) =>
          //    SafeArea(child: Container(color: Colors.black,))
          //    ,)

          Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            //margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'PRICE DETAILS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total MRP'),
                      Text(
                        '\$ ${cart.totalAmount}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Discount on MRP'),
                      Text(
                        'Rs. xyz',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coupon Discount'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Apply Coupon',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Convenience Fee'),
                      Text(
                        'FREE',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => ci.CartItems(
                id: cart.items.values.toList()[index].id,
                productId: cart.items.keys.toList()[index],
                title: cart.items.values.toList()[index].title,
                quantity: cart.items.values.toList()[index].quantity,
                price: cart.items.values.toList()[index].price,
                imageUrl: cart.items.values.toList()[index].imageUrl,
              ),
              itemCount: cart.items.length,
            ),
          ),
         // FlatButton(onPressed: (){}, child: Text('data')),
          OrderButton(cart: cart),
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
   // @required bool isLoading,
  }) :super(key: key) ;

  final Cart cart;
  //final bool _isLoading;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        color: Colors.pink,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child:
         _isLoading ? SpinKitSpinningCircle(
          color: Colors.amber[800],
          size: 70,
        )
        : 
        Text(  
          'Place Order',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white),
        ),
        onPressed: widget.cart.totalAmount <= 0 || _isLoading
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                await Provider.of<Orders>(context, listen: false)
                    .addOrder(
                        widget.cart.items.values.toList(), widget.cart.totalAmount);

                setState(() {
                  _isLoading = false;
                });
                widget.cart.clearCart();
              },
      ),
    );
  }
}
