import 'package:equatable/equatable.dart';

abstract class BaseBlocEvent extends Equatable {}

class FetchEvent extends BaseBlocEvent{
  @override
  List<Object> get props => [];
}
