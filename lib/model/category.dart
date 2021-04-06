import 'package:flutter/cupertino.dart';
import 'package:foodey/model/food.dart';

class Category {
  final String id;
  final String title;
  final List<Food> foods;

  Category({@required this.id, @required this.title, @required this.foods});
}

final categories = [
  Category(id: "1", title: "Meat", foods: [
    foods[0],
    foods[1],
    foods[2],
  ]),
  Category(id: "2", title: "Junk Food", foods: [
    foods[3],
  ]),
];
