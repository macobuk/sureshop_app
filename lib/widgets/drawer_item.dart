import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Card(
        color: Theme.of(context).canvasColor,
        child: ListView(
          padding: EdgeInsets.all(10),
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
                Navigator.pop(context);
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
              onTap: () {},
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text(
                'Favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {},
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
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            SizedBox(
              height: 425,
            ),
            Divider(
                thickness: 10,
                height: 5,
                color: Theme.of(context).colorScheme.primary),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Anton',
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
