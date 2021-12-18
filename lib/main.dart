import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/pages/product_detail_page.dart';
import 'package:kharido_app/pages/products_overview_page.dart';
import 'package:provider/provider.dart';
import './providers/products_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily,
          //Color(0xFF1328A4)
        ),
        home: ProductOverviewPage(),
        routes: {
          ProductDetailPage.routeName: (ctx) => ProductDetailPage()
        },
    
      ),
    );
  }
}
