import 'package:flutter/material.dart';
import 'package:foodey/features/order/Order.dart';

class OrderRow extends StatefulWidget {
  final OrderItem _item;

  const OrderRow(this._item);

  @override
  _OrderRowState createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  var isToShowFood = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total: ${widget._item.total}"),
              IconButton(
                  icon: Icon(Icons.arrow_downward_rounded),
                  onPressed: () {
                    setState(() {
                      isToShowFood = !isToShowFood;
                    });
                  }),
            ],
          ),
          if (isToShowFood)
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(widget._item.products[index].title),
                  subtitle:
                      Text("Price: ${widget._item.products[index].qty}"),
                  trailing: Text("Qty: ${widget._item.products[index].qty}"),
                );
              },
              itemCount: widget._item.products.length,
            ),
        ],
      ),
    );
  }
}
