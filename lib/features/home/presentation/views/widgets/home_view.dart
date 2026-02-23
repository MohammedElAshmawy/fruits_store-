import 'package:e_commerce/core/cubits/products_cubit.dart';
import 'package:e_commerce/core/helper/service_locator.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        child: HomeViewBody(),
      ),
    );
  }
}

