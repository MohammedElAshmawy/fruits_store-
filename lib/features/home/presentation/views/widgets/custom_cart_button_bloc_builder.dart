import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../checkout/presentation/views/checkout_view.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButtonBlocBuilder extends StatelessWidget {
  const CustomCartButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(context, CheckoutView.routeName,
              arguments: context.read<CartCubit>().cartEntity
              );
            } else {
              showSnackBar(context, AppStrings.cartIsEmpty);
            }
          },
          text:
              "الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}  جنيه",
        );
      },
    );
  }
}