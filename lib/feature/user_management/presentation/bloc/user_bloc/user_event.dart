part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUserList extends UserEvent {}

class PostAddUser extends UserEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;

  PostAddUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
  });
}

class OnSearchUser extends UserEvent {
  final String keyword;

  OnSearchUser({required this.keyword});
}

class OnFilterUser extends UserEvent {
  final String filterType;

  OnFilterUser({required this.filterType});
}
