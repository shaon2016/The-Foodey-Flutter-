import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:foodey/model/food.dart';

abstract class CartRepo {
  Future<List<CartItem>> fetchCartItems();
}

class CartRepoImpl implements CartRepo {
  // final List<CartItem> _items = [];

  @override
  Future<List<CartItem>> fetchCartItems() async {
    final List<CartItem> _items = [];
    return [..._items];
  }
  //
  // void addToCart(Food food) {
  //   var found = false;
  //
  //   for (int i = 0; i < _items.length; i++) {
  //     final ct = _items[i];
  //     if (food.id == ct.f.id) {
  //       found = true;
  //       _items[i].quantity++;
  //       break;
  //     }
  //   }
  //
  //   if (!found) {
  //     final ct = CartItem(id: DateTime.now().toString(), f: food, quantity: 1);
  //     _items.add(ct);
  //   }
  // }
  //
  // double get totalPrice {
  //   var total = 0.0;
  //
  //   _items.forEach((element) {
  //     total += (element.quantity * element.f.price);
  //   });
  //
  //   return total;
  // }
  //
  // void incrementQuantity(String id) {
  //   final index = _getIndex(id);
  //   _items[index].quantity++;
  // }
  //
  // void decrementQuantity(String id) {
  //   final index = _getIndex(id);
  //   final item = _items[index];
  //
  //   if (item.quantity > 1) {
  //     _items[index].quantity--;
  //   }
  // }
  //
  // int _getIndex(String id) {
  //   return _items.indexWhere((element) => element.id == id);
  // }
  //
  // void clear() {
  //   _items.clear();
  // }
}