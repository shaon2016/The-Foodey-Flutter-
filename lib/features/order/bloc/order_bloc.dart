import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodey/features/order/bloc/order_event.dart';
import 'package:foodey/features/order/bloc/order_state.dart';
import 'package:foodey/features/order/data/order_repo.dart';
import 'package:foodey/features/order/order.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepoImpl orderRepoImpl;

  OrderBloc({@required this.orderRepoImpl}) : super(OrderInitialState());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is FetchOrderEvent) {
      yield OrderLoadingState();

      try {
       final List<OrderItem> orders =  await orderRepoImpl.getOrders();
       yield OrderLoadedState(orders: orders);
      } catch (_) {
        yield OrderLoadFailureState();
      }
    }
  }
}
