import 'package:flutter/material.dart';

void showSnackBarError(BuildContext context,String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));
}
