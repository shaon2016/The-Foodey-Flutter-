import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {

}

class ProductFetchEvent extends ProductEvent{
  @override
  List<Object> get props => [];
}