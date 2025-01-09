import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_cubit_practice/cubit_posts_restApi/model/products_model.dart';
import 'package:flutter_bloc_cubit_practice/cubit_posts_restApi/service/api_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductsModel> productsModelList = [];

  ProductBloc() : super(ProductInitial()) {
    ApiService apiService = ApiService();

    on<GetAllProducts>((event, emit) async {
      // TODO: implement event handler
      try{
        emit(ProductLoading());
        productsModelList = await apiService.fetchProducts();
        emit(ProductLoaded(productsModelList));
      } catch(e) {
        emit(ProductLoadingError(e.toString()));
      }
    });
  }
}
