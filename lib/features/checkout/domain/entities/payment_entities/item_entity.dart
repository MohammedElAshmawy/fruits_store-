import 'package:e_commerce/features/home/domain/entities/cart_item_entities.dart';

class ItemEntity {
  ItemEntity({
    required this.quantity,
    required this.price,
    required this.name,
    required this.currency,
  });

  int quantity;
  String price;
  String name;
  String currency;

  factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) =>
      ItemEntity(
          quantity: cartItemEntity.quantity,
          price: cartItemEntity.productEntity.price.toString(),
          name: cartItemEntity.productEntity.name,
          currency: getCurrency()
      );

  Map<dynamic, dynamic> toJson() => {
    "quantity": quantity,
    "price": price,
    "name": name,
    "currency": currency,
  };
}

String getCurrency(){
  return "USD";
}