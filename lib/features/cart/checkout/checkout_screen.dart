import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodey/features/cart/checkout/checkout_cart_item.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/order/order.dart';
import 'package:provider/provider.dart';

var _isloading = false;

class CheckoutScreen extends StatefulWidget {
  static final routeName = "/checkout";

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;

    final appbar = AppBar(
      title: Text("Checkout"),
    );

    final double appbarSize = appbar.preferredSize.height;
    final double statusBarHeight = mediaQuery.padding.top;
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: _isloading == true
          ? null
          : SafeArea(
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
                              "${cart.totalPrice}",
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
                        setState(() {
                          _isloading = true;
                        });
                        await Provider.of<Order>(context, listen: false)
                            .postOrder(cart.items, cart.totalPrice);
                        setState(() {
                          _isloading = false;
                        });
                        cart.clear();
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(builder: (c) => HomeScreen()),
                        //     ModalRoute.withName(HomeScreen.routeName));
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routeName, (route) => false);
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
            ),
      body: _isloading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                    return CheckoutCartRow(cart.items[index].id);
                  },
                  itemCount: cart.items.length,
                ),
              ),
            ],
          ),
    );
  }
}
