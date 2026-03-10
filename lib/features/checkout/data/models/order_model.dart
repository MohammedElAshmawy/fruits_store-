import 'package:e_commerce/features/checkout/data/models/shipping_address_model.dart';
import '../../domain/entities/order_input_entity.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderInputEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uId: entity.uID,
      shippingAddressModel: ShippingAddressModel.fromEntity(entity.shippingAddressEntity),
      orderProducts: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: entity.payWithCash == true ? 'cash' : 'online',
      orderId: entity.uID,
    );
  }

  toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}