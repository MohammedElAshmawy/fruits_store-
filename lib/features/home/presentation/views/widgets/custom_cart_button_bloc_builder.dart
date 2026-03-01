import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButtonBlocBuilder extends StatelessWidget {
  const CustomCartButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit,CartItemState>(
      buildWhen: (previous, current) {
        if(current is CartItemUpdated){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {},
          text:
          "الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}  جنيه",
        );
      },
    );
  }
}
