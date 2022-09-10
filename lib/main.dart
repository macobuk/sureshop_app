import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/orders_screen.dart';

import 'package:provider/provider.dart';
import 'providers/products.dart';
import './providers/cart.dart';
import '/providers/orders.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SureShop',
        theme: ThemeData(
          canvasColor: Colors.blueGrey,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber,
          ).copyWith(
              secondary: Color.fromARGB(255, 4, 188, 28), shadow: Colors.white),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
