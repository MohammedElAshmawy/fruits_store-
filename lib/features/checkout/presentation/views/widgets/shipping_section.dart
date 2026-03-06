import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ShippingItem(
          isSelected: selectedIndex == 1,
          title: AppStrings.payWhenReceive,
          subTitle: AppStrings.receiveInPlace,
          price: context.read<ShippingAddressEntity>().cartEntity.calculateTotalPrice().toString(),
          onTap: () {
            selectedIndex = 1;
            setState(() {
              context.read<ShippingAddressEntity>().payCash = true;
            });
          },
        ),
        const SizedBox(height: 12),
        ShippingItem(
          isSelected: selectedIndex == 2,
          title: AppStrings.payWithDebit,
          subTitle: AppStrings.defineWayPay,
          price: (context.read<ShippingAddressEntity>().cartEntity.calculateTotalPrice() + 20)
                  .toString(),
          onTap: () {
            selectedIndex = 2;
            setState(() {
              context.read<ShippingAddressEntity>().payCash = false;
            });
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}