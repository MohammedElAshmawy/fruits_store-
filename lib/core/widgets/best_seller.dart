import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Row(
        children: [
          Text(
            AppStrings.bestSellerText,
            style: TextStyles.bold16.copyWith(color: AppColors.black),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, BestSellingView.routeName);
            },
            child: Text(
              AppStrings.moreText,
              style: TextStyles.regular13.copyWith(
                color: AppColors.hintTextFormFieldColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
