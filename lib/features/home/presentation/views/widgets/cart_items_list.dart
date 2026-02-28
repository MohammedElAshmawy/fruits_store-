import 'package:e_commerce/features/home/domain/entities/cart_item_entities.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/devider.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItemEntities});

  final List<CartItemEntity> cartItemEntities;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: cartItemEntities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CartItem(
              cartItemEntities: cartItemEntities[index],
            ),
          );
        });
  }
}