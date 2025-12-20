import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.sizeOf(context).width-32,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right:MediaQuery.sizeOf(context).width*.4 ,
                child: SvgPicture.asset(AppAssets().onBoard2Image)),
            Container(
              width: MediaQuery.sizeOf(context).width*.5,
              decoration: BoxDecoration(
                image: DecorationImage(image:svg.Svg(AppAssets().featureBackgroundSVG),
                  fit: BoxFit.fill
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35,),
                  Text("عروض العيد",
                  style: TextStyles.regular13.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor
                  ),
                  ),
                  Spacer(),
                  Text("خصم 25%",
                  style: TextStyles.bold19.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.whiteColor
                  ),
                  ),
                  SizedBox(height: 15,),
                  FeaturedItemButton(onPressed: (){}),
                  SizedBox(height: 16,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
