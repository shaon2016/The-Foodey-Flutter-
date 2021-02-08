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
  final String id;
  CartIncrementEvent({@required this.id});
}

class CartDecrementEvent extends CartEvent {
  final String id;

  CartDecrementEvent({@required this.id});
}

class CartAddToCartEvent extends CartEvent {
  final Food food;

  CartAddToCartEvent({@required this.food});
}
