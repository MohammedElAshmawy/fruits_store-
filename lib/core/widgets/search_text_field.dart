import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 12),
            spreadRadius: 0,
          )
        ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(AppAssets().searchIcon))),
            suffixIcon: SizedBox(
                width:20,
                child: Center(child: SvgPicture.asset(AppAssets().filterIcon))),
            hintText: AppStrings.searchHintText,
            hintStyle: TextStyles.regular13.copyWith(
                color: AppColors.hintTextFormFieldColor,
                fontWeight: FontWeight.w400
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder()
        ),
      ),
    );
  }
}


OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
          width: 1,
          color: AppColors.borderColor
      )
  );
}
