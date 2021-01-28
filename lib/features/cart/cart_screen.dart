import 'package:flutter/material.dart';
import 'package:foodey/features/cart/checkout/checkout_screen.dart';
import 'package:foodey/features/order/Order.dart';
import 'package:foodey/list_row_widget/cart_item_row.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

class CartScreen extends StatelessWidget {
  static final routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;

    final appbar = AppBar(
      title: Text("Cart"),
    );

    final double appbarSize = appbar.preferredSize.height;
    final double statusBarHeight = mediaQuery.padding.top;

    return Scaffold(
      appBar: appbar,
      body: ChangeNotifierProvider(
       create: (ctx) => Order(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: deviceSize.height - 42 - appbarSize - statusBarHeight,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return CartRow(cart.items[index].id);
                },
                itemCount: cart.items.length,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CheckoutScreen.routeName);
                },
                child: Text(
                  "Checkout",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
