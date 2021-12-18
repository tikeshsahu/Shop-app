import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  String discount;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.brand,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      @required this.discount,
      this.isFavorite = false});
}
