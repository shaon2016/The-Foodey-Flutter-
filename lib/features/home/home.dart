import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_state.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/home/bloc/product_bloc.dart';
import 'package:foodey/features/home/bloc/product_state.dart';
import 'package:foodey/list_row_widget/food_row.dart';
import 'package:foodey/widgets/badge.dart';
import 'package:foodey/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static var routeName = "/home";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          BlocBuilder<CartBloc, CartState>(builder: (ctx, state) {
            if (state is CartLoadedState) {
              return Badge(
                child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, CartScreen.routeName)),
                value: "${state.cart.totalCount}",
                color: Colors.redAccent,
              );
            }
            return Container();
          })
          // Consumer<Cart>(
          //   builder: (ctx, cart, child) {
          //     return Badge(
          //       child: child,
          //       value: "${cart.totalCount}",
          //       color: Colors.redAccent,
          //     );
          //   },
          //   child: IconButton(
          //       icon: Icon(
          //         Icons.shopping_cart,
          //         color: Colors.white,
          //       ),
          //       onPressed: () =>
          //           Navigator.pushNamed(context, CartScreen.routeName)),
          // )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (ctx, state) {
          if (state is ProductInitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoadedState) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return FoodRow(food: state.foods[index]);
              },
              itemCount: state.foods.length,
            );
          } else {
            return Center(
              child: Text("Failed to load products"),
            );
          }
        },
      ),
    );
  }
}
