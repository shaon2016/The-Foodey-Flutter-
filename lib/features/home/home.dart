import 'package:flutter/material.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/details/food_details.dart';
import 'package:foodey/features/home/CustomSearchDelegate.dart';
import 'package:foodey/list_row_widget/food_row.dart';
import 'package:foodey/model/food.dart';
import 'package:foodey/widgets/badge.dart';
import 'package:foodey/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static var routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              Food f = await showSearch(
                  context: context, delegate: CustomSearchDelegate());

              Navigator.pushNamed(context, FoodDetails.routeName, arguments: f);
            },
            icon: Icon(Icons.search),
          ),
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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodRow(food: foods[index]);
        },
        itemCount: foods.length,
      ),
    );
  }
}
