import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/page_view_Item.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.images.onBoard1Image,
          backgroundImage: Assets.images.onBoard1BackgroundImage,
          subTitle: AppStrings.subTitleBoarding1,
          title:
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.titlePart1Boarding1,
                    style: TextStyles.bold23.copyWith(color: Color(0xff0C0D0D)),
                  ),
                  Text(
                    AppStrings.titlePart3Boarding1,
                    style: TextStyles.bold23.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Text(
                    AppStrings.titlePart2Boarding1,
                    style: TextStyles.bold23.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
          isVisible:true,
        ),
        PageViewItem(
          image: Assets.images.onBoard2Image,
          backgroundImage: Assets.images.onBoard2BackgroundImage,
          subTitle: AppStrings.subTitleBoarding2,
          title: Text(AppStrings.titleBoarding2,
          style: TextStyles.bold23,
          ),
          isVisible:false
        ),
      ],
    );
  }
}
