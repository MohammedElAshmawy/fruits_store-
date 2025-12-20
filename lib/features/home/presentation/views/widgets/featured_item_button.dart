import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*.35,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.whiteColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text("تسوق الان",
            style: TextStyles.bold13.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.black
        )),
      ),
    );
  }
}
