
import 'package:e_commerce/core/utils/strings.dart';
import 'package:flutter/material.dart';

Row orRowWidget() {
  return Row(
    children: [
      Expanded(child: Divider()),
      Text(AppStrings.or),
      Expanded(child: Divider()),
    ],
  );
}
