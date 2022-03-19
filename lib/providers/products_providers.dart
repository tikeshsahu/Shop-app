import 'package:flutter/material.dart';
import 'package:kharido_app/models/http_exception.dart';
import 'dart:convert';
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //     id: 'p1',
    //     title: 'ROADSTER',
    //     description: 'A Red Shirt!! Pretty Red!',
    //     price: 29.99,
    //     discount: '25% OFF',
    //     imageUrl:
    //         'https://media.istockphoto.com/photos/fit-man-standing-outdoors-in-a-city-picture-id1299360135?b=1&k=20&m=1299360135&s=170667a&w=0&h=UgQBFbpLbx6P-8s8O-3Fddzzb-aCY_Deu71BEiITe8E='),
    // Product(
    //   id: 'p2',
    //   title: "LEVI'S",
    //   description: 'A Nice Pair of Trousers.',
    //   price: 59.99,
    //   discount: '35% OFF',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'NYKAA',
    //   description: 'Warm and Cozy Scarf.',
    //   price: 19.99,
    //   discount: '50% OFF',
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'HRX',
    //   description: 'Dry Raglan T-Shirt.',
    //   price: 49.99,
    //   discount: '12% OFF',
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHRzaGlydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    // ),
  ];

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Product findByTitle(String title) {
    return _items.firstWhere((prod) => prod.title == title);
  }

  

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="createrId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://winged-hue-336112-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = Uri.parse(
          'https://winged-hue-336112-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken');
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
            isFavorite:
                favoriteData == null ? false : favoriteData[prodId] ?? false,
            discount: prodData['discount'],
            category: prodData['category']
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProducts(Product product) async {
    final url = Uri.parse(
        'https://winged-hue-336112-default-rtdb.firebaseio.com/products.json?auth=$authToken');

    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'createrId': userId,
            'discount': product.discount,
            'category': product.category
          }));
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          discount: product.discount,
          category: product.category);

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProducts(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://winged-hue-336112-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
            'discount': newProduct.discount,
            'category': newProduct.category
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {}
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://winged-hue-336112-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
