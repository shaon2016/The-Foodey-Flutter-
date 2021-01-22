import 'package:flutter/foundation.dart';
import 'package:foodey/model/food.dart';

class CartItem {
  final String id;
  final Food f;
  int quantity;

   CartItem({
    @required this.id,
    @required this.f,
    @required this.quantity,
  });
}
