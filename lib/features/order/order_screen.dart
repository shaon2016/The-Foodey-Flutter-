import 'package:flutter/material.dart';
import 'package:foodey/widgets/drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/order";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders"),),
      drawer: AppDrawer(),
    );
  }
}
