import 'package:flutter/material.dart';
import 'package:foodey/features/category/category_screen.dart';
import 'package:foodey/features/home/home.dart';
import 'package:foodey/features/order/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text('Welcome to the foodey world', style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.w500),)),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Categories'),
            onTap: () {
              Navigator.pushReplacementNamed(context, CategoryScreen.routeName);
            },
          ),
          ListTile(
            title: Text('My Orders'),
            onTap: () {
              Navigator.pushReplacementNamed(context, OrderScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
