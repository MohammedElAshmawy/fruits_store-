import 'package:e_commerce/features/home/domain/entities/cart_item_entities.dart';

import 'item_entity.dart';

class ItemListEntity {
  ItemListEntity({
    required this.items,
  });

  List<ItemEntity> items;


  factory ItemListEntity.fromEntity({required List<CartItemEntity> cartItems}) => ItemListEntity(
    items: cartItems.map((e) => ItemEntity.fromEntity(e)).toList(),
  );



  Map<dynamic, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}
