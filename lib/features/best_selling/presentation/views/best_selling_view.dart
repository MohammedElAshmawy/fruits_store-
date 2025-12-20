import 'package:e_commerce/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName="bestSellingView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BestSellingViewBody(),
    );
  }
}
