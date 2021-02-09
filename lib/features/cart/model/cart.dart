import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodey/features/order/order_post.dart';
import 'package:foodey/model/food.dart';
import 'cart_item.dart';

@immutable
class Cart {
  final List<CartItem> items;

  const Cart({this.items = const []});

  void addToCart(Food food) {
    var found = false;

    for (int i = 0; i < items.length; i++) {
      final ct = items[i];
      if (food.id == ct.f.id) {
        found = true;
        items[i].quantity++;
        break;
      }
    }

    if (!found) {
      final ct = CartItem(id: DateTime.now().toString(), f: food, quantity: 1);
      items.add(ct);
    }
  }

  CartItem item(String id) {
    final index = _getIndex(id);
    final item = items[index];
    return item;
  }

  int get totalCount {
    return items.length;
  }

  double get totalPrice {
    var total = 0.0;

    items.forEach((element) {
      total += (element.quantity * element.f.price);
    });

    return total;
  }

  void incrementQuantity(String id) {
    final index = _getIndex(id);
    items[index].quantity++;
  }

  void decrementQuantity(String id) {
    final index = _getIndex(id);
    final item = items[index];

    if (item.quantity > 1) {
      items[index].quantity--;
    }
  }

  int _getIndex(String id) {
    return items.indexWhere((element) => element.id == id);
  }

  void clear() {
    items.clear();
  }

  Future<List<CartItem>> postOrder(List<CartItem> items, double totalPrice) async {
    final url = "https://foodey-46739-default-rtdb.firebaseio.com/orders.json";

    final timestamp = DateTime.now();

    List<Products> products = [];

    items.forEach((element) {
      products.add(Products(
        id: element.id,
        title: element.f.title,
        price: element.f.price.toString(),
        qty: element.quantity.toString(),
      ));
    });

    final body = OrderRequest(
        total: totalPrice.toString(),
        orderTime: timestamp.toIso8601String(),
        products: products);

    Dio dio = new Dio();
    final response = await dio.post(url, data: jsonEncode(body));

    if (response.statusCode == 200) {
      items.clear();

      return items;
    } else {
      return items;
    }
  }
}
