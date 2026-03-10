// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
//
// import 'core/widgets/show_snakbar_error.dart';
// import 'features/checkout/domain/entities/order_input_entity.dart';
// import 'features/checkout/presentation/cubits/add_order_cubit.dart';
//
// void paymentProcess(BuildContext context) {
//   var orderEntity = context.read<OrderInputEntity>();
//
//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (BuildContext context) => PaypalCheckoutView(
//       sandboxMode: true,
//       clientId: "YOUR_CLIENT_ID",
//       secretKey: "YOUR_SECRET_KEY",
//       transactions: getTransactions(orderEntity),
//       note: "Contact us for any questions on your order.",
//       onSuccess: (Map params) async {
//         context.read<AddOrderCubit>().addOrder(entity: orderEntity);
//         Navigator.pop(context);
//       },
//       onError: (error) {
//         showSnackBar(context, error.toString());
//         Navigator.pop(context);
//       },
//       onCancel: () {
//         Navigator.pop(context);
//       },
//     ),
//   ));
// }
//
// List<Map<String, dynamic>> getTransactions(OrderInputEntity orderEntity) {
//   return [
//     {
//       "amount": {
//         "total": orderEntity.cartEntity.calculateTotalPrice().toString(),
//         "currency": "USD",
//         "details": {
//           "subtotal": orderEntity.cartEntity.calculateTotalPrice().toString(),
//           "shipping": '0',
//           "shipping_discount": 0
//         }
//       },
//       "description": "The payment transaction description.",
//       "item_list": {
//         "items": orderEntity.cartEntity.cartItems
//             .map((e) => {
//           "name": e.productEntity.name,
//           "quantity": e.quantity,
//           "price": e.productEntity.price.toString(),
//           "currency": "USD"
//         })
//             .toList(),
//       }
//     }
//   ];
// }

