part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {}

class GetAllUserList extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
