import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_event.dart';
import 'package:foodey/features/cart/bloc/cart_bloc_state.dart';
import 'package:foodey/features/cart/data/cart_repo.dart';
import 'package:foodey/features/cart/model/cart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepoImpl repoImpl;

  CartBloc({@required this.repoImpl}) : super(CartInitialState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartFetchEvent) {
      yield CartInitialState();

      try {
        // final List<CartItem> items = await repoImpl.fetchCartItems();
        yield const CartLoadedState();
      } catch (_) {
        yield CartLoadFailureState();
      }
    }

    if (event is CartIncrementEvent) {
    yield*  _mapToCartItemIncrement(event, state);
    }
    if (event is CartDecrementEvent) {
      yield*   _mapToCartItemDecrement(event, state);
    }

    if (event is CartAddToCartEvent) {
      yield*     _mapToCartAddEvent(event, state);
    }

    if (state is CartLoadedState) {}

  }

  Stream<CartState> _mapToCartAddEvent(
      CartAddToCartEvent event, CartState state) async* {

    if (state is CartLoadedState) {
      try {
        yield CartLoadedState(
            cart: Cart(items: List.from(state.cart.items))
              ..addToCart(event.food));
      } catch (_) {
        yield CartLoadFailureState();
      }
    }
  }

  Stream<CartState> _mapToCartItemIncrement(
      CartIncrementEvent event, CartState state) async* {
    if (state is CartLoadedState) {
      try {
        yield CartLoadedState(
            cart: Cart(items: List.from(state.cart.items))
              ..incrementQuantity(event.food.id));
      } catch (_) {
        yield CartLoadFailureState();
      }
    }
  }

  Stream<CartState> _mapToCartItemDecrement(
      CartDecrementEvent event, CartState state) async* {
    if (state is CartLoadedState) {
      try {
        yield CartLoadedState(
            cart: Cart(items: List.from(state.cart.items))
              ..decrementQuantity(event.food.id));
      } catch (_) {
        yield CartLoadFailureState();
      }
    }
  }
}
