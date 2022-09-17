import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'providers/products.dart';
import './providers/auth.dart';
import './providers/cart.dart';
import './providers/orders.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products('', '', []),
            update: (context, Auth auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items,
            ),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (_) => Orders('', [], ''),
            update: (context, Auth auth, previousOrders) => Orders(
              auth.token,
              previousOrders == null ? [] : previousOrders.orders,
              auth.userId,
            ),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SureShop',
            theme: ThemeData(
              canvasColor: Colors.blueGrey,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.amber,
              ).copyWith(
                  secondary: Color.fromARGB(255, 4, 188, 28),
                  shadow: Colors.white),
              fontFamily: 'Lato',
            ),
            home: auth.isAuth
                ? ProductsOverviewScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: ((context, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
                  ),
            routes: {
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              UserProductsScreen.routeName: (context) => UserProductsScreen(),
              EditProductScreen.routeName: (context) => EditProductScreen(),
              // ProductsOverviewScreen.routeName: (context) =>
              // ProductsOverviewScreen(),
            },
          ),
        ));
  }
}
