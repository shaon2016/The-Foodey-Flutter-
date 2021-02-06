import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodey/features/order/order.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<OrderItem> orders;

  OrderLoadedState({ @required this.orders});
}

class OrderLoadFailureState extends OrderState {}
