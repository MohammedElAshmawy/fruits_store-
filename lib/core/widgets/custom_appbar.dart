import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_Styles.dart';

AppBar customAppbar({context, required String title, Widget? suffixIcon}) {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    automaticallyImplyActions: false,
    automaticallyImplyLeading: false,
    leading:
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 18),
            ),
          ),
  );
}

AppBar customProductsAppbar({context, required String title, Widget? suffixIcon}) {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    automaticallyImplyLeading: false,
    actions: [
      if (suffixIcon != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: suffixIcon
        ),
    ],
  );
}
