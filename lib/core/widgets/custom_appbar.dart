import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';

AppBar customAppbar({context,required String title,Icon? suffixIcon}) {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    title: Text(title,
    style: TextStyles.bold19,
    ),
    centerTitle: true,
    leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new_outlined, size: 24)),
  );
}
