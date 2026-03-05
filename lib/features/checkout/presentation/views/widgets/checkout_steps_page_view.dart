import 'package:e_commerce/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return getPages(formKey: formKey)[index];
      },
      controller: pageController,
      itemCount: getPages(formKey: formKey).length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }



  List<Widget> getPages({required GlobalKey<FormState> formKey}) {
    return [
      const ShippingSection(),
      AddressSection(formKey: formKey, valueListenable:valueListenable,),
      PaymentSection(),
    ];
  }
}

