import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/model/food.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];

  const CartEvent();
}

class CartFetchEvent extends CartEvent {
  // Cart cart;
  //
  // CartFetchEvent({this.cart = const Cart()});
  //
  // @override
  // List<Object> get props => [cart];
}

class CartIncrementEvent extends CartEvent {
  final Food food;

  CartIncrementEvent({@required this.food});
}

class CartDecrementEvent extends CartEvent {
  final Food food;

  CartDecrementEvent({@required this.food});
}

class CartAddToCartEvent extends CartEvent {
  final Food food;

  CartAddToCartEvent({@required this.food});
}
