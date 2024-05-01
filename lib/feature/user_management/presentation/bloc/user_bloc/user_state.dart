part of 'user_bloc.dart';

@immutable
sealed class UserState {
  const UserState();
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final List<User> data;

  const UserSuccess(this.data);
}

final class UserFailed extends UserState {
  final String message;

  const UserFailed(this.message);
}

final class AddUserLoading extends UserState {}

final class AddUserFailed extends UserState {
  final String message;

  const AddUserFailed(this.message);
}

final class AddUserSuccess extends UserState {}
