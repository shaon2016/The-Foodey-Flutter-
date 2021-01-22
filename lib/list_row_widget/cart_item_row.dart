import 'package:flutter/material.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:provider/provider.dart';

class CartRow extends StatelessWidget {
  final String id;

  const CartRow(this.id);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final ct = cart.item(id);

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
      trailing: Container(
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.decrementQuantity(id);
              },
            ),
            Text("${ct.quantity}"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cart.incrementQuantity(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
