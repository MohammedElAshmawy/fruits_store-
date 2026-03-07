import 'package:e_commerce/core/cubits/products_cubit.dart';
import 'package:e_commerce/core/helper/service_locator.dart';
import 'package:e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>ProductsCubit(getIt.get<ProductsRepo>()),
    child: const ProductsViewBody());
  }
}
