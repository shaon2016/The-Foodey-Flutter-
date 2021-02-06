

import 'package:dio/dio.dart';
import 'package:foodey/features/order/order.dart';
import 'package:foodey/features/order/order_post.dart';

abstract class OrderRepo {
  Future<List<OrderItem>> getOrders();
}

class OrderRepoImpl extends OrderRepo {

  Future<List<OrderItem>> getOrders() async {
    final url = "https://foodey-46739-default-rtdb.firebaseio.com/orders.json";

    final List<OrderItem> orders = [];
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

    return orders;
  }
}
