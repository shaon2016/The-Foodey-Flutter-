import 'package:flutter/material.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/features/cart/model/cart_item.dart';
import 'package:foodey/model/food.dart';
import 'package:provider/provider.dart';

class FoodRow extends StatelessWidget {
  final Food food;

  const FoodRow({@required this.food});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context, listen: false);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              food.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${food.price} BDT",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cart.addToCart(food);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
