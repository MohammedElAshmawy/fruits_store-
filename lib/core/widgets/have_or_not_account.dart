import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveOrNotAccount extends StatelessWidget {
  const HaveOrNotAccount({super.key,
    required this.firstText,
    required this.secondText,
    required this.navigation});

  final String firstText,secondText;
  final VoidCallback navigation;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyles.semiBold16.copyWith(color: AppColors.darkGreyColor),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () async{
                navigation();
              },
            text: secondText,
            style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );

  }
}
