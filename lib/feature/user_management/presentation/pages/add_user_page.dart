import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:user_management/feature/user_management/presentation/bloc/city_bloc/city_bloc.dart';
import 'package:user_management/feature/user_management/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:user_management/feature/user_management/presentation/widgets/button_widget.dart';
import 'package:user_management/feature/user_management/presentation/widgets/dropdown_widget.dart';
import 'package:user_management/feature/user_management/presentation/widgets/text_field_widget.dart';
import 'package:user_management/routes/app_router.dart';

import '../../../../core/utils/snack_bar.dart';

@RoutePage()
class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  String selectedCity = "";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isErrorCity = false;

  @override
  void initState() {
    super.initState();
    context.read<CityBloc>().add(GetCityList());
  }

  void addUser() {
    if (formKey.currentState!.validate() && selectedCity.isNotEmpty) {
      context.read<UserBloc>().add(
            PostAddUser(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneNumberController.text,
              address: addressController.text,
              city: selectedCity,
            ),
          );
    }
    if (selectedCity.isEmpty) {
      // showSnackBar(context, "Harap isi kota");
      isErrorCity = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController dropdownCtl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          style: theme.textTheme.displayMedium,
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                TextFieldWidget(
                  controller: nameController,
                  labelText: "Nama",
                  hintText: "Harap isi nama anda",
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFieldWidget(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "user@mail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFieldWidget(
                  controller: phoneNumberController,
                  labelText: "Nomor HP",
                  hintText: "08xxxx",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap isi Nomor HP";
                    }

                    if (!value.startsWith("08")) {
                      return "Nomor HP harus dimulai dengan 08";
                    }

                    if (value.length < 10) {
                      return "Panjang minimal nomor HP adalah 10 angka";
                    }

                    if (value.length > 14) {
                      return "Panjang maksimal nomor HP adalah 14 ankga";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFieldWidget(
                  controller: addressController,
                  labelText: "Alamat",
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                BlocConsumer<CityBloc, CityState>(
                  builder: (context, state) {
                    if (state is CityLoading) {
                      return DropdownWidget(
                        labelText: "--Loading--",
                        controller: dropdownCtl,
                        selectedItem: null,
                        onChange: (val) {},
                        items: const [],
                      );
                    }
                    if (state is CitySuccess) {
                      return DropdownWidget(
                        labelText: "Kota",
                        controller: dropdownCtl,
                        selectedItem:
                            selectedCity.isEmpty ? null : selectedCity,
                        onChange: (val) {
                          if (val != null) {
                            selectedCity = val;
                            isErrorCity = false;
                            setState(() {});
                          }
                        },
                        isError: isErrorCity,
                        items: state.data,
                      );
                    }
                    return const SizedBox();
                  },
                  listener: (context, state) {
                    if (state is CityFailed) {
                      showSnackBar(context, state.message);
                    }
                  },
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                BlocConsumer<UserBloc, UserState>(builder: (context, state) {
                  if (state is UserLoading) {
                    return SizedBox(
                      width: 97.w,
                      height: 5.h,
                      child: ButtonWidget(
                        onPressed: null,
                        child: FittedBox(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                            strokeWidth: 5,
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    width: 97.w,
                    height: 5.h,
                    child: ButtonWidget(
                      child: Text(
                        "Kirim",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        addUser();
                      },
                    ),
                  );
                }, listener: (context, state) {
                  if (state is AddUserFailed) {
                    showSnackBar(context, state.message);
                  }

                  if (state is AddUserSuccess) {
                    context.router.replace(const UserListRoute());
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
