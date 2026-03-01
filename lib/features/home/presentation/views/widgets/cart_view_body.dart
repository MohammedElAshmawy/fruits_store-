import 'package:e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'cart_items_list.dart';
import 'custom_cart_button_bloc_builder.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      customAppbar(title: AppStrings.basket),
                      const SizedBox(height: 12),
                      const CartHeader(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                CartItemsList(
                  cartItemEntities: context
                      .watch<CartCubit>()
                      .cartEntity
                      .cartItems,
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: CustomCartButtonBlocBuilder(),
        ),
      ],
    );
  }
}
