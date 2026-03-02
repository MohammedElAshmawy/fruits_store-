import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';

class ActivatedStepItem extends StatelessWidget {
  const ActivatedStepItem({super.key, required this.stepName});

  final String stepName;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.check,
          color: AppColors.whiteColor,
            size: 15,
          ),
        ),
        const SizedBox(width: 4,),
        Text(stepName,
        style: TextStyles.bold13.copyWith(
          color: AppColors.primaryColor
        ),
        )
      ],
    );
  }
}
