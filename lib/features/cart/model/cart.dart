
import 'package:flutter/foundation.dart';
import 'package:foodey/model/food.dart';
import 'cart_item.dart';
import 'package:http/http.dart' as http;

class Cart with ChangeNotifier {
  final List<CartItem> items = [];

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
    notifyListeners();
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


}
