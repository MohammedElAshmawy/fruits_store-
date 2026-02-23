import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/core/entities/products_entity.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:flutter/material.dart';
import 'custom_network_image.dart';

class GeneralItem extends StatelessWidget {
  const GeneralItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .45,
      height: 214,
      decoration: ShapeDecoration(
        color: AppColors.containerGreyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          SizedBox(height: 8),
          Positioned.fill(
            top: 30,
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(25),
                    child: CustomNetworkImage(
                      imageUrl: productEntity.imageUrl ?? "",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Text(
                      productEntity.name,
                      style: TextStyles.semiBold16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: productEntity.price.toString(),
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
                            maxLines: 2,
                            minFontSize: 12,
                            stepGranularity: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Spacer(),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(Icons.add, color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
