import 'package:e_commerce/features/checkout/domain/entities/payment_entities/item_entity.dart';

import '../order_input_entity.dart';
import 'details_entity.dart';

class AmountEntity {
  AmountEntity({
    required this.total,
    required this.currency,
    required this.details,
  });

  String total;
  String currency;
  DetailsEntity details;

  factory AmountEntity.fromEntity(OrderInputEntity orderEntity) => AmountEntity(
    currency: getCurrency(),
    total: orderEntity.cartEntity.calculateTotalPrice().toString(),
    details: DetailsEntity.fromEntity(orderEntity),

  );

  Map<dynamic, dynamic> toJson() => {
    "total": total,
    "currency": currency,
    "details": details.toJson(),
  };
}
