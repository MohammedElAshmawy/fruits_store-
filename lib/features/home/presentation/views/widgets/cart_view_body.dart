import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'cart_items_list.dart';

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
                 CartItemsList(cartItemEntities: []),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: CustomButton(
            onPressed: () {},
            text: "الدفع 120 جنيه",
          ),
        ),
      ],
    );
  }
}
