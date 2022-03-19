import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/pages/auth_page.dart';
import 'package:kharido_app/pages/edit_product_page.dart';
import 'package:kharido_app/pages/persons.dart';
import './providers/auth.dart';
import './pages/cart_page.dart';
import './pages/orders_page.dart';
import './pages/product_detail_page.dart';
import './pages/products_overview_page.dart';
import './pages/user_product_page.dart';
import './providers/orders.dart';
import 'package:provider/provider.dart';
import './providers/products_providers.dart';
import 'providers/cart.dart';
import './pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (context, auth, previousProducts) => Products(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider(create: (ctx) => Cart()),
          ChangeNotifierProvider(create: (ctx) => Persons()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            update: (context, auth, previousOrders) => Orders(
                auth.token,
                auth.userId,
                previousOrders == null ? [] : previousOrders.orders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              fontFamily: GoogleFonts.lato().fontFamily,
              //Color(0xFF1328A4)
            ),
            debugShowCheckedModeBanner: false,
            home: auth.isAuth
                ? ProductOverviewPage()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthPage(),
                  ),
            routes: {
              ProductOverviewPage.routeName: (ctx) => ProductOverviewPage(),
              ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
              CartPage.routeName: (ctx) => CartPage(),
              OrdersPage.routeName: (ctx) => OrdersPage(),
              UserProductsPage.routeName: (ctx) => UserProductsPage(),
              EditProductPage.routeName: (ctx) => EditProductPage(),
              //WelcomePage.routeName: (ctx) => WelcomePage(),
              // LoginPage.routeName: (ctx) => LoginPage(),
              // SignUpPage.routeName: (ctx) => SignUpPage(),
              AuthPage.routeName: (ctx) => AuthPage()
            },
          ),
        ));
  }
}
