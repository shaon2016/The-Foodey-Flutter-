import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodey/features/cart/model/cart.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];

  const CartState();
}

class CartInitialState extends CartState {}

class CartLoadedState extends CartState {
  const CartLoadedState({this.cart = const Cart()});

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

class CartLoadFailureState extends CartState {}
