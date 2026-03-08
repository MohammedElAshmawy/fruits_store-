import 'package:e_commerce/core/helper/service_locator.dart';
import 'package:e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce/core/services/supabase_auth_service.dart';
import 'package:e_commerce/core/widgets/add_order_bloc_consummer.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_input_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/cubits/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {

  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = "checkoutView";

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: Provider.value(
              value: OrderInputEntity(
                  cartEntity,
                  uID: getIt.get<SupabaseAuthService>().getUserID(),
                  shippingAddressEntity: ShippingAddressEntity()
              ),
              child: const AddOrderBlocConsumer(
              child: CheckoutViewBody())

          ),
        ),
      ),
    );
  }
}
