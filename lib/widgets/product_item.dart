import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

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
    final product = Provider.of<Product>(
      context,
    );
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
        //header: GridTileBar(
        //leading: CircleAvatar(
        //backgroundColor: Theme.of(context).colorScheme.secondary,
        //child: Text(
        // '\$' '$price',
        // style: TextStyle(
        //   fontSize: 10,
        //   color: Colors.black,
        // ),
        // ),
        //),
        //),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).colorScheme.secondary),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.shopping_cart,
              ),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
