import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/order/bloc/order_bloc.dart';
import 'package:foodey/features/order/bloc/order_state.dart';
import 'package:foodey/features/order/order.dart';
import 'package:foodey/list_row_widget/order_row.dart';
import 'package:foodey/widgets/drawer.dart';

class OrderScreen extends StatelessWidget {
  static final routeName = "/order";

  @override
  Widget build(BuildContext context) {
    // final order = Provider.of<Order>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (ctx, state) {
          if (state is OrderLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OrderLoadedState) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                OrderItem item = state.orders[index];
                return OrderRow(item);
              },
              itemCount: state.orders.length,
            );
          } else if (state is OrderLoadFailureState) {
            return Container(
              child: Text("Ami mara khaichi"),
            );
          }

          return Container();
        },
      ),
      // FutureBuilder(
      //   future: order.fetchOrders(),
      //   builder: (context,  dataSnap) {
      //     if (!dataSnap.hasData)
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     else if (dataSnap.hasError) {
      //       return Container(
      //         child: Text("Ami mara khaichi"),
      //       );
      //     } else {
      //       return ListView.builder(
      //         itemBuilder: (ctx, index) {
      //           OrderItem item = dataSnap.data[index];
      //           return OrderRow(item);
      //         },
      //         itemCount: dataSnap.data.length,
      //       );
      //     }
      //   },
      // ),
    );
  }
}


