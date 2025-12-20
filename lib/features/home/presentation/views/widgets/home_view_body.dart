import 'package:e_commerce/core/widgets/best_seller.dart';
import 'package:e_commerce/core/widgets/search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/featured_item_list.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    CustomHomeAppbar(),
                    SizedBox(height: 12,),
                    SearchTextField(),
                    SizedBox(height: 25,),
                    FeaturedItemList(),
                    SizedBox(height: 16,),
                    BestSeller(),
                  ],
                ),
              ),
              ProductsGridView()
            ],
          ),
        ),
      ),
    );
  }
}