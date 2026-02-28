import 'package:e_commerce/features/home/domain/entities/cart_item_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_Styles.dart';
import '../../../../../core/widgets/custom_network_image.dart';
import '../../../../../gen/assets.gen.dart';
import 'cart_item_actions_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntities});

  final CartItemEntity cartItemEntities;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
                imageUrl: cartItemEntities.productEntity.imageUrl!),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(cartItemEntities.productEntity.name, style: TextStyles.bold13),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.images.trash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntities.quantity} كم',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '${cartItemEntities.productEntity.price} جنيه',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
