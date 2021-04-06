import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodey/features/category/foods_screen.dart';
import 'package:foodey/model/category.dart';

class CategoryRow extends StatelessWidget {
  final Category category;

  const CategoryRow({@required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FoodScreen.routeName, arguments: category.foods);
      },
      child: Container(
        margin: EdgeInsets.only(top: 16,),
        color: Colors.black12,
        height: 120,
        width: double.infinity,
        child: Center(child: Text(category.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
