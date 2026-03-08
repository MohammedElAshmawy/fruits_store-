import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/show_snakbar_error.dart';
import '../../../domain/entities/order_input_entity.dart';

class StepItemList extends StatelessWidget {
  const StepItemList(
      {super.key, required this.currentPageIndex, required this.onStepTapped});

  final int currentPageIndex;
  final ValueChanged<int> onStepTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        getStepName().length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderInputEntity>().payWithCash == null) {
                showSnackBar(
                    isError: false,
                    context, AppStrings.chooseWayToPay);
                return;
              }
              onStepTapped(index);
            },
            child: StepItem(
              isActive: index <= currentPageIndex,
              stepName: getStepName()[index],
              index: (index + 1).toString(),
            ),
          ),
        ),
      ),
    );
  }

  List<String> getStepName() {
    return [
      AppStrings.shipping,
      AppStrings.address,
      AppStrings.payment,
    ];
  }
}
