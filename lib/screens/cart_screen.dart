import 'package:flutter/material.dart';
import '../widgets/drawer_item.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';

import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        foregroundColor: Colors.white,
      ),
      drawer: DrawerItem(),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                    ),
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: OrderButton(cart: cart),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: ((context, index) => ci.CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                  cart.items.values.toList()[index].title,
                )),
          ))
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(
                'BUY NOW',
                style: TextStyle(color: Colors.white),
              ),
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary),
        onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(),
                  widget.cart.totalAmount,
                );
                setState(() {
                  _isLoading = false;
                });
                widget.cart.clear();
              });
  }
}
