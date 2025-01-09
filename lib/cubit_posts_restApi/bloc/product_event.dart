part of 'product_bloc.dart';

@immutable
sealed class ProductEvent extends Equatable {}

class GetAllProducts extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
