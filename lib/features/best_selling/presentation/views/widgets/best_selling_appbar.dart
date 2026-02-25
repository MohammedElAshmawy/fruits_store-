import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildBestSellingAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Icon(Icons.arrow_back_ios_outlined),
    title: Center(
      child: Text(AppStrings.bestSellerText,
        style: TextStyles.bold19,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SvgPicture.asset(Assets.images.notificationIcon,
          width: 34,
          height: 34,
        ),
      )
    ],
  );
}