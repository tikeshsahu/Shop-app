import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kharido_app/pages/products_overview_page.dart';
import 'package:kharido_app/widgets/drawer.dart';
import 'package:kharido_app/widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import 'cart_page.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitDualRing(
                color: Colors.amber[800],
                size: 40,
              ),
            );
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text('Showing'),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'All Orders',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 147),
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons
                                        .settings_input_composite_outlined),
                                    label: Text(
                                      'Filter',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (ctx, i) => OrderItem(
                          order: orderData.orders[i],
                        ),
                      ),
                    )
                  ],
                ),
                // ListView.builder(
                //       itemCount: orderData.orders.length,
                //       itemBuilder: (ctx, i) => OrderItem(order:orderData.orders[i]),
                //     ),
              );
            }
          }
        },
      ),
    );
  }
}
