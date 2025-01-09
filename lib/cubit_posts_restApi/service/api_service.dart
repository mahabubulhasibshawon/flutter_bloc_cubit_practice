import 'package:dio/dio.dart';
import 'package:flutter_bloc_cubit_practice/cubit_posts_restApi/model/products_model.dart';


class ApiService {
  Future<List<ProductsModel>> fetchProducts() async {
    List<ProductsModel> productsDataList = [];
    final Dio dio = Dio();

    try {
      // gesponse from api
      Response response = await dio.get('https://api.escuelajs.co/api/v1/products');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (var element in data) {
          ProductsModel productsModel = ProductsModel.fromJson(element);
          productsDataList.add(productsModel);
        }
        return productsDataList;
      }
      else {
        return [];
      }
    }
    catch(e) {
      throw e.toString();
    }
  }
}