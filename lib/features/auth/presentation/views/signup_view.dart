import 'package:e_commerce/core/helper/show_custom_dialog.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/auth/domain/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(body: signupViewBodyBlocConsumer()),
    );
  }

  BlocConsumer<SignupCubit, SignupStates> signupViewBodyBlocConsumer() {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showSuccessDialog(context);
        }
        if (state is SignupError) {
          showSnackBarError(context,state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}