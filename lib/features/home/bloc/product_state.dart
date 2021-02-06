import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodey/model/food.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Food> foods;

  ProductLoadedState({@required this.foods});
}

class ProductLoadFailureState extends ProductState {}
