import 'package:e_commerce/core/cubits/products_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_gridview_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/best_seller.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'featured_item_list.dart';
import 'home_appbar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
                  CustomHomeAppbar(),
                  SizedBox(height: 12),
                  SearchTextField(),
                  SizedBox(height: 25),
                  FeaturedItemList(),
                  SizedBox(height: 16),
                  BestSeller(),
                ],
              ),
            ),
            ProductsGridViewBlocBuilder()
          ],
        ),
      ),
    );
  }
}
