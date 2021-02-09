import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_state.dart';
import 'package:foodey/features/cart/checkout/checkout_screen.dart';
import 'package:foodey/list_row_widget/cart_item_row.dart';

class CartScreen extends StatelessWidget {
  static final routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text("Cart"),
    );

    return Scaffold(
      appBar: appbar,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (ctx, state) {
          if (state is CartLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CartRow(state.cart.items[index]);
                    },
                    itemCount: state.cart.items.length,
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CheckoutScreen.routeName);
                      },
                      child: Text(
                        "Checkout",
                      ),
                    ),
                  ),
                )
              ],
            );
          } else if (state is CartInitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Center(
              child: Text("Something is wrong"),
            );
        },
      ),
    );
  }
}
