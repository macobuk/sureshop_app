import 'package:flutter/material.dart';
import '../widgets/drawer_item.dart';

import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;

import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: DrawerItem(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(ordersData.orders[i]),
      ),
    );
  }
}
