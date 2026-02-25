import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class SideTitle extends StatelessWidget {
  const SideTitle({super.key, required this.hasImage, required this.title});

  final bool hasImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyles.bold16.copyWith(color: AppColors.black),
          ),
          Spacer(),
          hasImage?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SvgPicture.asset(Assets.images.filter2),
          ):
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
