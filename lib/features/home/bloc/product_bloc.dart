import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/home/bloc/product_event.dart';
import 'package:foodey/features/home/bloc/product_state.dart';
import 'package:foodey/features/home/data/food_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FoodRepoImpl foodRepoImpl;

  ProductBloc({@required this.foodRepoImpl}) : super(ProductInitialState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductFetchEvent) {
      yield ProductLoadingState();

      try {
        final foods = await foodRepoImpl.getFoods();
        yield ProductLoadedState(foods: foods);
      } catch (_) {
        yield ProductLoadFailureState();
      }
    }
  }
}
