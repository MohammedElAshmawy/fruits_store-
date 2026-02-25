import 'package:e_commerce/features/home/presentation/views/products_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

import 'cart_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = "homeView";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
            children: [
              HomeView(),
              ProductsView(),
              CartView(),
            ]
        ),
      ),
    );
  }
}
