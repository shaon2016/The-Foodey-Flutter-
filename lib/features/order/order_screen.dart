import 'package:flutter/material.dart';
import 'package:foodey/list_row_widget/order_row.dart';
import 'package:foodey/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'Order.dart';

class OrderScreen extends StatefulWidget {
  static final routeName = "/order";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => Order(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        drawer: AppDrawer(),
        body: Consumer<Order>(
          builder: (ctx, order, child) {
            order.fetchOrders();
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return OrderRow(order.orders[index]);
              },
              itemCount: order.orders.length,
            );
          },
        ),
      ),
    );
  }
}
