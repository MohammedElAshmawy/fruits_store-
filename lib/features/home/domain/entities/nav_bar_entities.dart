import 'package:e_commerce/gen/assets.gen.dart';

class NavBarEntities {
  final String activatedIcon, unActivatedIcon;
  final String name;

  const NavBarEntities({
    required this.activatedIcon,
    required this.unActivatedIcon,
    required this.name,
  });
}

List<NavBarEntities> get bottomNavBarItems => [
  NavBarEntities(
    activatedIcon: Assets.activatedIcons.home,
    unActivatedIcon: Assets.unactivatedIcons.homeUnactivated,
    name: 'الرئيسية',
  ),
  NavBarEntities(
    activatedIcon: Assets.activatedIcons.products,
    unActivatedIcon: Assets.unactivatedIcons.productsUnactivated,
    name: 'المنتجات',
  ),
  NavBarEntities(
    activatedIcon: Assets.activatedIcons.basket,
    unActivatedIcon: Assets.unactivatedIcons.basketUnactivated,
    name: 'سلة التسوق',
  ),
  NavBarEntities(
    activatedIcon: Assets.activatedIcons.myAccount,
    unActivatedIcon: Assets.unactivatedIcons.myAccountUnactivated,
    name: 'حسابي',
  ),
];
