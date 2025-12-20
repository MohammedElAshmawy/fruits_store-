import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/core/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        SizedBox(width: 15),
        Expanded(
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.acceptTermsAndConditions,
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.darkGreyColor
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.termsAndConditions,
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.primaryColor
                    )

                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
