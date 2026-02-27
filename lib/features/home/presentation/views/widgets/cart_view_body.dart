import 'package:e_commerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  customAppbar(title: AppStrings.basket),
                  SizedBox(height: 12),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            CartItemsList(),
          ],
        ),
      ),
    );
  }
}