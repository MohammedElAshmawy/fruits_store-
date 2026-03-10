import 'package:e_commerce/features/checkout/domain/entities/order_input_entity.dart';

class DetailsEntity {
  DetailsEntity({
    required this.shipping,
    required this.shippingDiscount,
    required this.subtotal,
  });

  String shipping;
  double shippingDiscount;
  String subtotal;

factory DetailsEntity.fromEntity(OrderInputEntity orderEntity) => DetailsEntity(
    shipping: orderEntity.calculateShippingCost().toString(),
    shippingDiscount: orderEntity.calculateShippingDiscount(),
    subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
  );

  Map<dynamic, dynamic> toJson() => {
    "shipping": shipping,
    "shipping_discount": shippingDiscount,
    "subtotal": subtotal,
  };
}
