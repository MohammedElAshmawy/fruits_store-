import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_Styles.dart';

class UnactivatedStepItem extends StatelessWidget {
  const UnactivatedStepItem({super.key, required this.stepName, required this.index});

  final String stepName,index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: AppColors.lightGrey.withValues(alpha: 0.6),
          child: Text(index,
          style: TextStyles.bold13.copyWith(
            color: AppColors.black,
          ),
          ),
        ),
        const SizedBox(width: 4,),
        Text(stepName,
          style: TextStyles.bold13.copyWith(
              color: AppColors.lightGrey
          ),
        )
      ],
    );
  }
}
