import 'package:flutter/material.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/details/food_details.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (c) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          FoodDetails.routeName: (ctx) => FoodDetails(),
        },
      ),
    );
  }
}
