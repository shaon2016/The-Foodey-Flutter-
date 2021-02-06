import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_event.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/checkout/checkout_screen.dart';
import 'package:foodey/features/cart/data/cart_repo.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/details/food_details.dart';
import 'package:foodey/features/home/bloc/product_bloc.dart';
import 'package:foodey/features/home/bloc/product_event.dart';
import 'package:foodey/features/home/data/food_repo.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/login/login_screen.dart';
import 'package:foodey/features/order/bloc/order_bloc.dart';
import 'package:foodey/features/order/bloc/order_event.dart';
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
        BlocProvider<OrderBloc>(
            create: (ctx) => OrderBloc(orderRepoImpl: OrderRepoImpl())
              ..add(FetchOrderEvent())),
        BlocProvider<ProductBloc>(
            create: (ctx) => ProductBloc(foodRepoImpl: FoodRepoImpl())
              ..add(ProductFetchEvent())),
        BlocProvider<CartBloc>(
            create: (ctx) => CartBloc(repoImpl: CartRepoImpl())..add(CartFetchEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
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
