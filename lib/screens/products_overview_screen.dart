import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../widgets/drawer_item.dart';

import '../screens/cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItem(),
      appBar: AppBar(
        title: Text('SureShop'),
        foregroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
              color: Colors.green,
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.blueGrey,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text(
                          'Only Favorites',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: FilterOptions.Favorites),
                    PopupMenuItem(
                      child: Text(
                        'Show All',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: FilterOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
