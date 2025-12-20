import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key,
    required this.title,
    required this.icon,
    required this.onPressed});


  final String title;
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderContainerColor
        )
      ),
      child: TextButton(
          onPressed: onPressed,
          child: ListTile(
            title: Center(child: Text(title)),
            leading: icon,
          ),
      ),
    );
  }
}
