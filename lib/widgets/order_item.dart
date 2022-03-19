import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  const OrderItem({this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '\$ ${widget.order.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
            ),
            
            subtitle: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                DateFormat('hh:mm     dd-MM-yyyy ').format(widget.order.dateTime),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              icon: Icon(
                  expanded ? Icons.expand_less_rounded : Icons.expand_more),
            ),
          ),
          if (expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 60, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              ),
                              Text(
                                '${prod.quantity}  x  \$ ${prod.price}',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.livvic().fontFamily,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
