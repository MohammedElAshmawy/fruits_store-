import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import '../../../home/domain/entities/cart_entity.dart';

class OrderInputEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderInputEntity(
      this.cartEntity, {
        this.payWithCash,
        required this.shippingAddressEntity,
        required this.uID,
      });


}