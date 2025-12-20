import 'package:e_commerce/core/helper/get_user.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/profile_image.png"),
        SizedBox(width: 6,),
        Column(
          children: [
            Text(AppStrings.goodMorningText,
                style: TextStyles.regular16.copyWith(
                    color:AppColors.hintTextFormFieldColor,
                    fontWeight: FontWeight.w400
                )),
            Text(getUser().name,
              style: TextStyles.regular16.copyWith(
                  color:AppColors.black
              ),
            )
          ],
        ),
        Spacer(),
        SvgPicture.asset(AppAssets().notificationIcon,
          width: 34,
          height: 34,
        )
      ],
    );
  }
}