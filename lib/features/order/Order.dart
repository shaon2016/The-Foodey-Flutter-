import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:foodey/features/order/order_post.dart';

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> products;
  final String orderTime;

  const OrderItem({
    @required this.id,
    @required this.total,
    @required this.products,
    @required this.orderTime,
  });
}

class Order with ChangeNotifier {
  final List<OrderItem> orders = [];

  Future<Void> postOrder(List<CartItem> items, double totalPrice) async {
    final url = "https://foodey-46739-default-rtdb.firebaseio.com/orders.json";

    final timestamp = DateTime.now();

    List<Products> products = [];

    items.forEach((element) {
      products.add(Products(
        id: element.id,
        title: element.f.title,
        price: element.f.price,
        qty: element.quantity,
      ));
    });

    final body = OrderPostRequest(
        total: totalPrice,
        orderTime: timestamp.toIso8601String(),
        products: products);

    Dio dio = new Dio();
    final response = await dio.post(url, data: jsonEncode(body));

    if (response.statusCode == 200) {
    } else {}
  }
}
