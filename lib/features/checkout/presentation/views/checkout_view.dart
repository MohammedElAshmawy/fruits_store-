import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {

  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = "checkoutView";

  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Provider.value(
            value: ShippingAddressEntity(cartEntity: cartEntity),
            child: CheckoutViewBody()),
      ),
    );
  }
}
