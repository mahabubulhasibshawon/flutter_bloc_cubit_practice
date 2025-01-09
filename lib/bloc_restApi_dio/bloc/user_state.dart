part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  final List<UserModel> userModelList;

  UserLoaded(this.userModelList);

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList];
}
class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}