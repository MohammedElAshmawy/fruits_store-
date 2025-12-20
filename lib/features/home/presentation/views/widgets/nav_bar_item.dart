import 'package:e_commerce/features/home/domain/entities/nav_bar_entities.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/activated_icon.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/unactivated_icon.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.navBarEntities,
  });

  final bool isSelected;
  final NavBarEntities navBarEntities;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActivatedIcon(icon: navBarEntities.activatedIcon, text: navBarEntities.name,)
        : UnActivatedIcon(icon: navBarEntities.unActivatedIcon);
  }
}