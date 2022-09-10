import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(thickness: 10, height: 5, color: Colors.blueGrey),
          ListTile(
            leading: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            title: const Text('My Orders'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Divider(thickness: 10, height: 5, color: Colors.blueGrey),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            title: const Text('Favorites'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Divider(thickness: 10, height: 5, color: Colors.blueGrey),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            title: const Text('View My Cart'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SizedBox(
            height: 400,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
