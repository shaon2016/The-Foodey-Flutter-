import 'package:flutter/foundation.dart';
import 'package:foodey/model/food.dart';

class CartItem {
  final String id;
  final Food f;
  final int quantity;

  const CartItem({
    @required this.id,
    @required this.f,
    @required this.quantity,
  });
}
