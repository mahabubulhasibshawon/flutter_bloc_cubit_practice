import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/bloc_restApi_dio/model/user_model.dart';

import '../bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserError) {
            return Center(child: Text(state.message));
          }
          if (state is UserLoaded) {
            return _view(context, state.userModelList);
          }
          return Container();
        },
      ),
    );
  }
}

Widget _view(BuildContext context, List<UserModel> userModelList) {
  return ListView.builder(
      itemCount: userModelList.length,
      itemBuilder: (context, index) {
        UserModel userModel = userModelList[index];
        return ListTile(
          leading: Text(userModel.id.toString()),
          title: Text(userModel.username.toString()),
          subtitle: Text('Zip code : ${userModel.address!.zipcode.toString()}'),
        );
      });
}
