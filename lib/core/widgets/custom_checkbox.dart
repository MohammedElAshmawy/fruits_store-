import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key, required this.isChecked,
    required this.onChecked
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
          decoration: ShapeDecoration(
            color: isChecked? AppColors.primaryColor:AppColors.transperentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: isChecked? AppColors.primaryColor: AppColors.borderContainerColor
                )
              )
          ),
          duration: Duration(milliseconds: 300),
          child:isChecked? Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(Assets.images.checked),
          ):SizedBox(),
      ),
    );
  }
}