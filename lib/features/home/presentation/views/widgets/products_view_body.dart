import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_gridview_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/products_cubit.dart';
import '../../../../../core/widgets/side_title.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/search_text_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  customProductsAppbar(
                    suffixIcon: SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notification_add_rounded),
                      ),
                    ),
                    title: AppStrings.productsText,
                  ),
                  SizedBox(height: 12),
                  SearchTextField(),
                  SizedBox(height: 25),
                  SideTitle(
                    hasImage: true,
                    title: "${context.read<ProductsCubit>().productLength} ${AppStrings.resultsText}"
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            ProductsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
