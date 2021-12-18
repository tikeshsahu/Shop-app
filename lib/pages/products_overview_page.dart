import 'package:flutter/material.dart';
import 'package:kharido_app/widgets/products_item.dart';
import '../models/product.dart';

class ProductOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      brand: 'ROADSTER',
      description: 'A Red shirt!! Pretty red!',
      price: 29.99,
      discount: '25% OFF',
      imageUrl:
           'https://media.istockphoto.com/photos/fit-man-standing-outdoors-in-a-city-picture-id1299360135?b=1&k=20&m=1299360135&s=170667a&w=0&h=UgQBFbpLbx6P-8s8O-3Fddzzb-aCY_Deu71BEiITe8E='
    ),
    Product(
      id: 'p2',
      brand: "LEVI'S",
      description: 'A nice pair of trousers.',
      price: 59.99,
      discount: '35% OFF',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      brand: 'NYKAA',
      description: 'Warm and cozy Scarf.',
      price: 19.99,
      discount: '50% OFF',
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      brand: 'HRX',
      description: 'Dry Raglan T-shirt.',
      price: 49.99,
      discount: '10% OFF',
      imageUrl:
          'https://images.unsplash.com/photo-1622445275463-afa2ab738c34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHRzaGlydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Color(0xFF1328A4),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ProductsGrid(loadedProducts: loadedProducts),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const  ProductsGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, index) => ProductItem(
        id: loadedProducts[index].id,
        brand: loadedProducts[index].brand,
        description: loadedProducts[index].description,
        price: loadedProducts[index].price,
        imageUrl: loadedProducts[index].imageUrl,
        discount: loadedProducts[index].discount,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //childAspectRatio: 0.5,
        mainAxisExtent: 340,
        //crossAxisSpacing: 0,
        //mainAxisSpacing: 0,
      ),
    );
  }
}
