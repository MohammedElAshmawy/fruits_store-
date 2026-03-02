import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          isSelected: selectedIndex==1,
          title: AppStrings.payWhenReceive,
          subTitle: AppStrings.receiveInPlace,
          price: '40',
          onTap: (){
            selectedIndex=1;
            setState(() {});
          },
        ),
        SizedBox(height: 12),
        ShippingItem(
          isSelected: selectedIndex==2,
          title: AppStrings.payWithDebit,
          subTitle: AppStrings.defineWayPay,
          price: "60",
          onTap: (){
            selectedIndex=2;
            setState(() {});
          },
        ),
      ],
    );
  }
}
