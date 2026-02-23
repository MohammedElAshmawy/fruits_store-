import 'package:e_commerce/core/helper/show_custom_dialog.dart';
import 'package:e_commerce/core/helper/service_locator.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:e_commerce/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName="login";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>LoginCubit(getIt<AuthRepo>(),getIt<AuthRepoSupabase>()),
        child: loginBlocConsumer());
  }

  BlocConsumer<LoginCubit, LoginStates> loginBlocConsumer() {
    return BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, MainView.routeName);
          }
          if (state is LoginErrorState) {
            showSnackBarError(context,state.message);
          }
        },
        builder: (context,state){
          return ModalProgressHUD(
              inAsyncCall: state is LoginLoadingState,
              child: LoginViewBody());
        },
      );
  }
}
