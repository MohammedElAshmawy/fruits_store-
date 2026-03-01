import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:equatable/equatable.dart';

/// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateItemPrice() {
    return productEntity.price * quantity;
  }

  void increaseCount() {
    quantity++;
  }

  void decreaseCount() {
    if (quantity > 0) {
      quantity--;
    }
  }

  @override
  List<Object?> get props => [productEntity, quantity];
}
