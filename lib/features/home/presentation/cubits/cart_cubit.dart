import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isProductExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(ProductAdded());
  }
}
