import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:user_management/feature/user_management/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:user_management/feature/user_management/presentation/widgets/button_widget.dart';
import 'package:user_management/feature/user_management/presentation/widgets/card_user_widget.dart';
import 'package:user_management/feature/user_management/presentation/widgets/filter_button_widget.dart';
import 'package:user_management/feature/user_management/presentation/widgets/search_field_widget.dart';
import 'package:user_management/routes/app_router.dart';

@RoutePage()
class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String filterType = "nameA";
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserList());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    EasyDebounce.cancel('search');
  }

  void onFilterName() {
    if (context.read<UserBloc>().state is! UserFailed &&
        context.read<UserBloc>().state is! UserLoading) {
    if (filterType == "nameA") {
        context.read<UserBloc>().add(OnFilterUser(filterType: "nameZ"));
        filterType = "nameZ";
        setState(() {});
      } else {
        context.read<UserBloc>().add(OnFilterUser(filterType: "nameA"));
        filterType = "nameA";
        setState(() {});
      }
    }
  }

  void onFilterCity() {
    if (context.read<UserBloc>().state is! UserFailed &&
        context.read<UserBloc>().state is! UserLoading) {
      if (filterType == "cityA") {
        context.read<UserBloc>().add(OnFilterUser(filterType: "cityZ"));
        filterType = "cityZ";
        setState(() {});
      } else {
        context.read<UserBloc>().add(OnFilterUser(filterType: "cityA"));
        filterType = "cityA";
        setState(() {});
      }
    }
  }

  void onSearch(String keyword) {
    if (context.read<UserBloc>().state is! UserFailed &&
        context.read<UserBloc>().state is! UserLoading) {
      EasyDebounce.debounce("search", const Duration(milliseconds: 500), () {
        context.read<UserBloc>().add(OnSearchUser(keyword: keyword));
      });
    }
  }

  @override
  Widget build(BuildContext ctx) {
    final theme = Theme.of(ctx);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 20.sp,
        ),
        onPressed: () {
          context.router.push(const AddUserRoute());
        },
      ),
      appBar: AppBar(
        title: Text("User List", style: theme.textTheme.displayMedium),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            color: theme.colorScheme.background,
            padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
            // height: 7.h,
            child: SearchFieldWidget(
              controller: searchController,
              hintText: "Cari Pengguna",
              onChange: (v) {
                onSearch(v);
              },
            ),
          ),
          Container(
            color: theme.colorScheme.background,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              children: [
                Expanded(
                    child: FilterButtonWidget(
                  name: "Nama",
                  onPressed: () {
                    onFilterName();
                  },
                )),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                    child: FilterButtonWidget(
                  name: "Kota",
                  onPressed: () {
                    onFilterCity();
                  },
                )),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          BlocConsumer<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 73.h -
                      (MediaQuery.of(ctx).viewInsets.bottom +
                          MediaQuery.of(ctx).viewPadding.bottom),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                );
              }
              if (state is UserSuccess) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 73.h -
                      (MediaQuery.of(ctx).viewInsets.bottom +
                          MediaQuery.of(ctx).viewPadding.bottom),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1.5.h,
                    ),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => CardUserWidget(
                      name: state.data[index].name,
                      email: state.data[index].email,
                      phoneNumber: state.data[index].phoneNumber,
                      city: state.data[index].city,
                      address: state.data[index].address,
                    ),
                  ),
                );
              }
              if (state is UserFailed) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 73.h -
                      (MediaQuery.of(ctx).viewInsets.bottom +
                          MediaQuery.of(ctx).viewPadding.bottom),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ButtonWidget(
                          onPressed: () {
                            context.read<UserBloc>().add(GetUserList());
                          },
                          child: Text(
                            "Coba Lagi",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ]),
                );
              }

              return const SizedBox();
            },
            listener: (context, state) {},
          ),
        ],
      ),
    );
  }
}
