import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_event.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_state.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:provider/provider.dart';

class CartRow extends StatelessWidget {
  final CartItem ct;

  const CartRow(this.ct);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (c, s) {
        if (s is CartLoadedState)
          {
            return ListTile(
              leading: Image.network(
                "${s.cart.item(ct.id).f.imageUrl}",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                s.cart.item(ct.id).f.title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "${s.cart.item(ct.id).f.price}",
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
                        context
                            .read<CartBloc>()
                            .add(CartDecrementEvent(id: ct.id));
                      },
                    ),
                    Text("${ct.quantity}"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartIncrementEvent(id: ct.id));
                      },
                    ),
                  ],
                ),
              ),
            );
          }

        return Container();
      },
    );
  }
}
