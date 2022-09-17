import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/auth.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  // final String title;
  //final String imageUrl;
  //final double price;

  //ProductItem(
  //this.id,
  // this.title,
  //this.imageUrl,
  //this.price,
  //);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  product.toggleFavoriteStatus(authData.token, authData.userId);
                },
                color: Colors.amber),
          ),
          title: Text(product.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          trailing: IconButton(
              onPressed: (() {
                cart.addItems(
                  product.id,
                  product.price,
                  product.title,
                );
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Added Item to Cart!',
                  ),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                      label: 'CANCEL',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ));
              }),
              icon: Icon(
                Icons.shopping_cart,
              ),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
