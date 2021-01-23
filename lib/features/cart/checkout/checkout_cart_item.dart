import 'package:flutter/material.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:provider/provider.dart';

class CheckoutCartRow extends StatefulWidget {
  final String id;

  const CheckoutCartRow(this.id);

  @override
  _CartRowState createState() => _CartRowState();
}

class _CartRowState extends State<CheckoutCartRow> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final ct = cart.item(widget.id);

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
