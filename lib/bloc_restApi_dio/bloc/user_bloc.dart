import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/bloc_restApi_dio/model/user_model.dart';
import 'package:flutter_bloc_cubit_practice/bloc_restApi_dio/service/api_service.dart';
import "package:meta/meta.dart";

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userModelList = [];

  UserBloc() : super(UserInitial()) {
    ApiService apiService = ApiService();

    on<GetAllUserList>((event, emit) async {
      // TODO: implement event handler
      try{
        emit(UserLoading());
        userModelList = await apiService.getData();
        emit(UserLoaded(userModelList));
      } catch(e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
