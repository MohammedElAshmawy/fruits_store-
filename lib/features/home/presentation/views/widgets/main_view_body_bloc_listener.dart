import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/widgets/show_snakbar_error.dart';
import 'package:e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,CartState>(
      listener: (context, state) {
        if(state is ProductAdded){
          showSnackBar(context,AppStrings.operationDone);
        }else if (state is ProductRemoved){
          showSnackBar(
              isError: false,
              context,AppStrings.deleteDone);
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
