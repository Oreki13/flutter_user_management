import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/core/usecase/use_case.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecase/add_user.dart';
import '../../../domain/usecase/user_list.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserList _userList;
  final AddUser _addUser;

  UserBloc({
    required UserList userList,
    required AddUser addUser,
  })  : _userList = userList,
        _addUser = addUser,
        super(UserInitial()) {
    on<UserEvent>((event, emit) => emit(UserLoading()));
    on<GetUserList>(_onGetAllUser);
    on<PostAddUser>(_onAddUser);
    on<OnFilterUser>(_onFilterUser);
    on<OnSearchUser>(_onSearchUser);
  }

  List<User> dataUser = [];

  void _onGetAllUser(
    GetUserList event,
    Emitter<UserState> emit,
  ) async {
    final res = await _userList.call(NoParams());
    res.fold(
      (l) => emit(
        UserFailed(l.message),
      ),
      (r) {
        dataUser = r;
        dataUser.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        return emit(
          UserSuccess(dataUser),
        );
      },
    );
  }

  void _onAddUser(
    PostAddUser event,
    Emitter<UserState> emit,
  ) async {
    // emit(AddUserLoading());
    final res = await _addUser.call(User(
      name: event.name,
      email: event.email,
      phoneNumber: event.phoneNumber,
      city: event.city,
      address: event.address,
    ));
    res.fold(
      (l) => emit(AddUserFailed(l.message)),
      (r) => emit(AddUserSuccess()),
    );
  }

  void _onSearchUser(OnSearchUser event, Emitter<UserState> emit) {
    if (event.keyword.isNotEmpty) {
      List<User> result = [];
      for (int i = 0; i < dataUser.length; i++) {
        if (dataUser[i]
            .name
            .toLowerCase()
            .contains(event.keyword.toLowerCase())) {
          result.add(dataUser[i]);
        }
      }
      return emit(UserSuccess(result));
    }
    return emit(UserSuccess(dataUser));
  }

  void _onFilterUser(OnFilterUser event, Emitter<UserState> emit) {
    List<User> data = dataUser;

    if (event.filterType == "nameA") {
      data.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return emit(UserSuccess(data));
    }

    if (event.filterType == "nameZ") {
      data.sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
      return emit(UserSuccess(data));
    }

    if (event.filterType == "cityA") {
      data.sort((a, b) => a.city.toLowerCase().compareTo(b.city.toLowerCase()));
      return emit(UserSuccess(data));
    }

    if (event.filterType == "cityZ") {
      data.sort((a, b) => b.city.toLowerCase().compareTo(a.city.toLowerCase()));
      return emit(UserSuccess(data));
    }
  }
}
