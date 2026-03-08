import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/checkout/presentation/cubits/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../features/checkout/presentation/cubits/add_order_state.dart';

class AddOrderBlocConsumer extends StatelessWidget {
  const AddOrderBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      builder: (BuildContext context, state) {
        return ModalProgressHUD(
          color: AppColors.primaryColor,
          inAsyncCall: state is AddOrderLoadingState,
          child: child,
        );
      },
      listener: (BuildContext context, state) {
        if (state is AddOrderFailureState) {
          showSnackBar(context, state.errMessage);
        }
        if (state is AddOrderSuccessState) {
          showSnackBar(
              isError: false,
              context, 'تم العمليه بنجاح');
        }
      },
    );
  }
}
