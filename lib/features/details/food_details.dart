import 'package:flutter/material.dart';
import 'package:foodey/features/cart/cart_screen.dart';
import 'package:foodey/features/cart/model/cart.dart';
import 'package:foodey/model/food.dart';
import 'package:foodey/widgets/badge.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatelessWidget {
  static final routeName = "/food_details";

  @override
  Widget build(BuildContext context) {
    final Food _food = ModalRoute.of(context).settings.arguments as Food;
    final cart = Provider.of<Cart>(context, listen: false);

    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;

    final appbar = AppBar(
      title: Text(_food.title),
      actions: [
        Consumer<Cart>(
          builder: (ctx, cart, child) {
            return Badge(
              child: child,
              value: "${cart.totalCount}",
              color: Colors.redAccent,
            );
          },
          child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, CartScreen.routeName)),
        )
      ],
    );

    final double appbarSize = appbar.preferredSize.height;
    final double statusBarHeight = mediaQuery.padding.top;

    return Scaffold(
      bottomNavigationBar:  SizedBox(
        height: 42,
        width: double.infinity,
        child: RaisedButton(
          child: Text("Add to cart"),
          onPressed: () {
            cart.addToCart(_food);
          },
        ),
      ),
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _food.imageUrl,
              fit: BoxFit.fill,
              height: 180,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_food.price} BDT",
                    style:
                        TextStyle(fontSize: 24, color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac pretium magna. Mauris nulla risus, scelerisque scelerisque viverra sed, venenatis eu metus. Curabitur pretium ex ut semper porta. Donec mattis pellentesque iaculis. Donec sodales sem sed tincidunt laoreet. Integer ullamcorper nunc ac dui ultrices sagittis. Etiam vel turpis at massa tincidunt consequat. Pellentesque porttitor viverra urna, at convallis eros tempus sed. Morbi et augue quam. Ut quis diam blandit diam sodales molestie. Aliquam porta elit pulvinar eleifend tempus. Curabitur maximus, est lacinia congue finibus, purus nibh aliquam ex, vel maximus dui felis vel nulla. Ut id urna nec neque dapibus pretium. Nulla scelerisque id enim commodo sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    "Vivamus mattis interdum aliquet. Vestibulum ut felis in tortor consequat ultricies. Morbi est mauris, mattis a mi sit amet, eleifend suscipit tortor. Pellentesque pretium porttitor consequat. Vivamus nec dolor vitae quam ornare pulvinar. In mollis leo odio, at laoreet libero dignissim ac. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus eget porta libero. Suspendisse gravida dapibus quam a vulputate. Nullam volutpat justo vel mauris blandit facilisis sit amet vitae neque. Nullam imperdiet hendrerit erat, ut mattis nisl elementum iaculis.",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
