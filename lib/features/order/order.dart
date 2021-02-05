import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:foodey/features/order/order_post.dart';

class OrderItem {
  String id;
  String total;
  List<OrderedProduct> products;
  String orderTime;

  OrderItem({
    @required this.id,
    @required this.total,
    @required this.products,
    @required this.orderTime,
  });

  OrderItem.fromJson(Map<String, dynamic> json) {
    orderTime = json['order_time'];
    if (json['products'] != null) {
      products = new List<OrderedProduct>();
      json['products'].forEach((v) {
        products.add(new OrderedProduct.fromJson(v));
      });
    }
    total = json['total'];
  }
}

class OrderedProduct {
  String id;
  String title;
  String price;
  String qty;

  OrderedProduct({this.id, this.title, this.price, this.qty});

  OrderedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    qty = json['qty'];
    title = json['title'];
  }
}

class Order with ChangeNotifier {
  final List<OrderItem> orders = [];

  Future<void> postOrder(List<CartItem> items, double totalPrice) async {
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
    } else {}
  }

  Future fetchOrders() async {
    final url = "https://foodey-46739-default-rtdb.firebaseio.com/orders.json";
    Dio dio = new Dio();
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final mapData = response.data as Map<String, dynamic>;

      mapData.forEach((orderId, OrderData) {
        final order = OrderRequest.fromJson(OrderData);

        final List<OrderedProduct> p = [];

        order.products.forEach((element) {
          p.add(OrderedProduct(
              id: element.id,
              title: element.title,
              price: element.price.toString(),
              qty: element.qty));
        });

        final oi = OrderItem(
            id: orderId,
            total: order.total,
            products: p,
            orderTime: order.orderTime);

        orders.add(oi);
      });
    } else {}

    notifyListeners();
    return orders;
  }
}
