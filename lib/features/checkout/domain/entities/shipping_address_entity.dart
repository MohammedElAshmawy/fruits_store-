import 'package:e_commerce/features/checkout/domain/entities/address_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';

class ShippingAddressEntity {
  final CartEntity cartEntity;
  bool? payCash;
  AddressEntity addressEntity=AddressEntity();

  ShippingAddressEntity({
    required this.cartEntity,
    this.payCash
  });
}