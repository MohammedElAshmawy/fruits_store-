import 'dart:convert';
import 'package:e_commerce/features/checkout/domain/entities/order_input_entity.dart';
import 'amount_entity.dart';
import 'item_list_entity.dart';

String paymentEntityToJson(PaymentEntity data) => json.encode(data.toJson());

class PaymentEntity {
    PaymentEntity({
        required this.amount,
        required this.itemList,
        required this.description,
    });

    AmountEntity amount;
    ItemListEntity itemList;
    String description;

    factory PaymentEntity.fromEntity(OrderInputEntity orderEntity) => PaymentEntity(
    amount: AmountEntity.fromEntity(orderEntity),
    itemList: ItemListEntity.fromEntity(cartItems: orderEntity.cartEntity.cartItems),
    description: "Contact us for any questions on your order.",
    );

    Map<dynamic, dynamic> toJson() => {
        "amount": amount.toJson(),
        "item_list": itemList.toJson(),
        "description": description,
    };
}