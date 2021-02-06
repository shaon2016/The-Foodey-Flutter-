import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {}

class FetchOrderEvent extends OrderEvent{
  @override
  List<Object> get props => [];

}

