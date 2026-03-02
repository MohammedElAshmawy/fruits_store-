import 'package:e_commerce/features/checkout/presentation/views/widgets/activated_step_item.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/unactivated_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.stepName, required this.index, required this.isActive});

  final String stepName,index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActivatedStepItem(stepName: stepName),
      secondChild: UnactivatedStepItem(stepName: stepName, index: index,),
      crossFadeState: isActive? CrossFadeState.showFirst: CrossFadeState.showSecond,
      duration: Duration(
        milliseconds: 300
      ),
    );
  }
}
