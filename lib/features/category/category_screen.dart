
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/widgets/badge.dart';
import 'package:foodey/widgets/drawer.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static var routeName = "/category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Categories"),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) {
              return Badge(
                child: child,
                value: "${cart.totalCount}",
                color: Colors.redAccent,
              );
            },
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, CartScreen.routeName)),
          ),
        ],
      ),
      /*body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodRow(food: foods[index]);
        },
        itemCount: foods.length,
      ),*/
    );
  }

}