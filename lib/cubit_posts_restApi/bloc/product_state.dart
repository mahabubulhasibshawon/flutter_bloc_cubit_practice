part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ProductLoadingError extends ProductState {
  final String message;

  ProductLoadingError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


class ProductLoaded extends ProductState {
  final List<ProductsModel> productsModelList;

  ProductLoaded(this.productsModelList);
  @override
  // TODO: implement props
  List<Object?> get props => [productsModelList];
}
