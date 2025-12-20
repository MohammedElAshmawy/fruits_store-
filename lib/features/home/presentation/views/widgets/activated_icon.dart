import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivatedIcon extends StatelessWidget {
  const ActivatedIcon({super.key, required this.text, required this.icon});

  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(icon)),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style:
              TextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}