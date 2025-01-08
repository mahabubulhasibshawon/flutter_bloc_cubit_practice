import 'package:dio/dio.dart';
import 'package:flutter_bloc_cubit_practice/bloc_restApi_dio/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userDataList = [];
    final Dio dio = Dio();
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (var element in data) {
          UserModel userModel = UserModel.fromJson(element);
          userDataList.add(userModel);
        }
        return userDataList;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
