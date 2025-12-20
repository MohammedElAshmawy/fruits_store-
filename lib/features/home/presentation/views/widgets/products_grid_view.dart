import 'package:e_commerce/core/widgets/general_item.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 55/66,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8
      ),
      itemBuilder: (context, index) {
        return GeneralItem();
      },
    );
  }
}