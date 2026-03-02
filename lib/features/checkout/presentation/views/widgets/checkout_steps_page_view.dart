import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key, required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return getPages()[index];
      },
      controller: pageController,
      itemCount: getPages().length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

List<Widget> getPages(){
  return [
    ShippingSection(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
}
