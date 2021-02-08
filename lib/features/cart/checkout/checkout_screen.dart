import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_state.dart';
import 'package:foodey/features/cart/checkout/checkout_cart_item.dart';


class CheckoutScreen extends StatefulWidget {
  static final routeName = "/checkout";

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text("Checkout"),
    );

    return Scaffold(
      appBar: appbar,
      bottomNavigationBar:
          BlocBuilder<CartBloc, CartState>(builder: (ctx, state) {
        if (state is CartLoadedState) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Total: "),
                          Text(
                            "${state.cart.totalPrice}",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Vat included, where applicable",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () async {
                      // setState(() {
                      //   _isloading = true;
                      // });
                      // await Provider.of<Order>(context, listen: false)
                      //     .postOrder(cart.items, cart.totalPrice);
                      // setState(() {
                      //   _isloading = false;
                      // });
                      // cart.clear();
                      // // Navigator.pushAndRemoveUntil(
                      // //     context,
                      // //     MaterialPageRoute(builder: (c) => HomeScreen()),
                      // //     ModalRoute.withName(HomeScreen.routeName));
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, HomeScreen.routeName, (route) => false);
                    },
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      }),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (ctx, state) {
          if (state is CartInitialState || state is PostOrderState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoadFailureState) {
            return Center(
              child: Text("Something is wrong or no data in the cart"),
            );
          }
          if (state is CartLoadedState) {
            return Column(
              children: [
                //  Address portion
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Mostafizur Rahman"),
                        ],
                      ),
                      Text(
                        "Edit".toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 8),
                  child: Text(
                      "Home no: 19, Road 01, Firozshah, Pahartali, Chottogram."),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.payment_rounded,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Bill to the same address"),
                        ],
                      ),
                      Text(
                        "Edit".toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("01521401596"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("ashiq201@yahoo.com"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CheckoutCartRow(state.cart.items[index]);
                    },
                    itemCount: state.cart.items.length,
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
