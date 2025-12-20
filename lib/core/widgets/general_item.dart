import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';

class GeneralItem extends StatelessWidget {
  const GeneralItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*.45,
      height: 214,
      decoration: ShapeDecoration(
        color: AppColors.containerGreyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          SizedBox(height: 8),
          Positioned.fill(
            top: 30,
            child: Column(
              children: [
                Image.asset("assets/images/watermelon_test.png"),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Text("بطيخ", style: TextStyles.semiBold16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "20",
                                style: TextStyles.bold13.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: " ${AppStrings.poundText} / ",
                                style: TextStyles.bold13.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              TextSpan(
                                text: AppStrings.kiloText,
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(Icons.add,
                          color: AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
