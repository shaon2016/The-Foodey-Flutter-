import 'package:flutter/material.dart';
import 'package:foodey/features/order/order.dart';
import 'package:foodey/list_row_widget/order_row.dart';
import 'package:foodey/widgets/drawer.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static final routeName = "/order";

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: order.fetchOrders(),
        builder: (context,  dataSnap) {
          if (!dataSnap.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (dataSnap.hasError) {
            return Container(
              child: Text("Ami mara khaichi"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                OrderItem item = dataSnap.data[index];
                return OrderRow(item);
              },
              itemCount: dataSnap.data.length,
            );
          }
        },
      ),
    );
  }
}
