import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

import '../screens/cart_screen.dart';

import '../helpers/custom_route.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Card(
        color: Theme.of(context).canvasColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(
              thickness: 10,
              height: 5,
              color: Colors.amber,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              title: const Text(
                'My Orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  CustomRoute(
                    builder: (context) => OrdersScreen(),
                  ),
                );
              },
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: const Text(
                'View My Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(CartScreen.routeName);
              },
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: const Text(
                'Manage Your Products',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/');
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
            Divider(
              thickness: 10,
              height: 5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
