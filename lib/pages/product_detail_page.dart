import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('adsffg'),
      ),
    );
  }
}
