import 'package:flutter/material.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/list_row_widget/food_row.dart';
import 'package:foodey/model/food.dart';
import 'package:foodey/widgets/badge.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static var routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
          )
        ],
      ),
      drawer: Container(),
      body: Provider(
       create: (ctx) => Cart(),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return FoodRow(food: foods[index]);
          },
          itemCount: foods.length,
        ),
      ),
    );
  }
}
