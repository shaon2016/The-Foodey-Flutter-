import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/checkout/checkout_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/details/food_details.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/login/login_screen.dart';
import 'package:foodey/features/order/bloc/order_bloc.dart';
import 'package:foodey/features/order/data/order_repo.dart';
import 'package:foodey/features/order/order.dart';
import 'package:foodey/features/order/order_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (ctx) => OrderBloc(orderRepoImpl: OrderRepoImpl()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OrderScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          FoodDetails.routeName: (ctx) => FoodDetails(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
