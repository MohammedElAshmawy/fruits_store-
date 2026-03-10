import 'package:e_commerce/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/text_Styles.dart';
import '../../../domain/entities/order_input_entity.dart';
import 'payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();

    bool payWithCash = orderEntity.payWithCash ?? true;
    double subTotal = orderEntity.cartEntity.calculateTotalPrice();
    double deliveryFee = payWithCash ? 0 : 30;

    return PaymentItem(
      title: AppStrings.orderSummary,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.subTotal,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                "$subTotal جنيه",
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                AppStrings.delivery,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                "$deliveryFee جنيه",
                textAlign: TextAlign.right,
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              const Text(
                AppStrings.total,
                style: TextStyles.bold16,
              ),
              const Spacer(),
              Text(
                "${subTotal + deliveryFee} جنيه",
                style: TextStyles.bold16,
              )
            ],
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
