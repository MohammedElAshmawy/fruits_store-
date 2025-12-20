import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/have_or_not_account.dart';
import 'package:e_commerce/core/widgets/or_row_widget.dart';
import 'package:e_commerce/core/widgets/social_button.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  late String email,password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: AppStrings.login),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KpaddingConst),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value){
                    email=value!;
                  },
                  hintText: AppStrings.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 19),
                CustomTextFormFieldForPassword(
                  onSaved: (value){
                    password=value!;
                  },
                  hintText: AppStrings.password,
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.forgetPassword,
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                CustomButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        LoginCubit.get(context).loginWithEmailAndPassword(email, password);
                      }
                    },
                    text: AppStrings.login),
                SizedBox(height: 19),
                HaveOrNotAccount(
                    firstText: AppStrings.dontHaveAccount,
                    secondText: AppStrings.doAccount,
                    navigation: (){
                      Navigator.pushNamed(context, SignUpView.routeName);
                    }),
                SizedBox(height: 24),
                orRowWidget(),
                SizedBox(height: 40),
                SocialButton(
                    title: AppStrings.signInWithGoogle,
                    icon: SvgPicture.asset(AppAssets().googleIcon),
                    onPressed: (){
                      LoginCubit.get(context).signInWithGoogle();
                    }),
                SizedBox(height: 24),
                SocialButton(
                    title: AppStrings.signInWithApple,
                    icon: SvgPicture.asset(AppAssets().appleIcon),
                    onPressed: (){}),
                SizedBox(height: 24),
                SocialButton(
                    title: AppStrings.signInWithFacebook,
                    icon: SvgPicture.asset(AppAssets().facebookIcon),
                    onPressed: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}