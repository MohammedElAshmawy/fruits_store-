import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_dot.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_Styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.semiBold13),
                  const SizedBox(height: 6),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: Colors.black.withValues(alpha: .5),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
