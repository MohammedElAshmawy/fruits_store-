import 'package:e_commerce/core/entities/products_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculatePrice(){
    return productEntity.price*quantity;
  }

   increaseCount(){
    quantity++;
  }
  decreaseCount(){
    quantity--;
  }

}
