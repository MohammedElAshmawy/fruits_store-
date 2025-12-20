import 'package:e_commerce/features/best_selling/presentation/views/widgets/best_selling_appbar.dart';
import 'package:flutter/material.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBestSellingAppBar(),
    );
  }
}