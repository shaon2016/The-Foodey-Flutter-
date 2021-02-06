import 'package:foodey/model/food.dart';

abstract class FoodRepo {
  Future<List<Food>> getFoods();
}

class FoodRepoImpl extends FoodRepo {
  Future<List<Food>> getFoods() async {
    return foods;
  }
}