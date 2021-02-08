import 'package:flutter/material.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:provider/provider.dart';

class CheckoutCartRow extends StatelessWidget {
  final CartItem ct;

  const CheckoutCartRow(this.ct);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Image.network(
        "${ct.f.imageUrl}",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      title: Text(
        ct.f.title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        "${ct.f.price}",
        style: TextStyle(
          fontSize: 13,
        ),
      ),
      trailing: Text("Qty: ${ct.quantity}"),
    );
  }
}


