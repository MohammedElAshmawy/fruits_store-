import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'products_grid_view.dart';
import '../../../../../core/cubits/products_cubit.dart';
import '../../../../../core/helper/get_dummy_products.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsLoadingState) {
          return Skeletonizer.sliver(
            child: ProductsGridView(products: getDummyProducts()),
          );
        } else if (state is ProductsErrorState) {
          debugPrint('❌ ProductsCubit Error: ${state.errMessage}');
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}