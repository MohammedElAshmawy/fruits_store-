import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/have_or_not_account.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, email, password;
  late bool isTermsAccepted = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: AppStrings.newAccount),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KpaddingConst),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                SizedBox(height: 19),
                CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: AppStrings.fullName,
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: AppStrings.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextFormFieldForPassword(
                  onSaved: (value) {
                    password = value!;
                  },
                  hintText: AppStrings.password,
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24),
                TermsAndConditions(
                  onChanged: (value) {
                    isTermsAccepted = value;
                  },
                ),
                SizedBox(height: 24),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>().signupWithSupabase(
                            name,
                            email,
                            password);
                      } else {
                        showSnackBarError(
                          context,
                          AppStrings.youShouldAcceptTerms,
                        );
                      }
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                    }
                  },
                  text: AppStrings.createNewAccount,
                ),
                SizedBox(height: 24),
                HaveOrNotAccount(
                  firstText: AppStrings.weHaveAccount,
                  secondText: AppStrings.login,
                  navigation: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}