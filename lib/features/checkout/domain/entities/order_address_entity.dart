import 'package:e_commerce/features/checkout/domain/entities/address_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';

class OrderAddressEntity {
  final CartEntity cartEntity;
  bool? payCash;
  AddressEntity addressEntity=AddressEntity();

  OrderAddressEntity({
    required this.cartEntity,
    this.payCash
  });
}