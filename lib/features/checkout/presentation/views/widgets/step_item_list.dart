import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class StepItemList extends StatelessWidget {
  const StepItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        getStepName().length,
        (index) => Expanded(
          child: StepItem(
              stepName: getStepName()[index],
              index: (index + 1).toString(),
              isActive: false),
        ),
      ),
    );
  }

  List<String> getStepName() {
    return [
      AppStrings.shipping,
      AppStrings.address,
      AppStrings.payment,
      AppStrings.revision,
    ];
  }
}
