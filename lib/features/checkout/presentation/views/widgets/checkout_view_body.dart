import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item_list.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_appbar.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            customAppbar(title: AppStrings.shipping),
            StepItemList(),
          ],
        ),
      ),

    );
  }
}
