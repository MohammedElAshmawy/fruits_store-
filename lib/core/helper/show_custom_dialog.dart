import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_jbrw3hcz.json",
              width: 240,
              height: 120,
              repeat: false,
            ),
            const SizedBox(height: 16),
            const Text(
              'تم التسجيل بنجاح!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
              },
              child:  Text('تم',
              style: TextStyles.semiBold16,
              ),
            ),
          ],
        ),
      );
    },
  );
}
