import 'package:e_commerce/gen/assets.gen.dart';

class NavBarEntities  {

  final String activatedIcon,unActivatedIcon;
  final String name;

  const NavBarEntities({
    required this.activatedIcon,
    required this.unActivatedIcon,
    required this.name});

}

List<NavBarEntities> get bottomNavBarItems => [
  NavBarEntities(
      activatedIcon: AppAssets().homeActivatedIcon,
      unActivatedIcon: AppAssets().homeUnActivatedIcon,
      name: 'الرئيسية'),
  NavBarEntities(
      activatedIcon: AppAssets().productsActivatedIcon,
      unActivatedIcon: AppAssets().productsUnActivatedIcon,
      name: 'المنتجات'),
  NavBarEntities(
      activatedIcon: AppAssets().basketActivatedIcon,
      unActivatedIcon: AppAssets().basketUnActivatedIcon,
      name: 'سلة التسوق'),
  NavBarEntities(
      activatedIcon: AppAssets().myAccountActivatedIcon,
      unActivatedIcon: AppAssets().myAccountUnActivatedIcon,
      name: 'حسابي'),
];
