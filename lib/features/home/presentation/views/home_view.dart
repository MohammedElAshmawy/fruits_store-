import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName="homeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: HomeViewBody(),
    );
  }
}