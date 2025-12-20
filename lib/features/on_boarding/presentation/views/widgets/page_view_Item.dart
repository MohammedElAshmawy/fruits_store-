import 'package:e_commerce/core/services/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/utils/strings.dart';
import 'package:e_commerce/core/utils/text_Styles.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });


  final String image, backgroundImage, subTitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(backgroundImage),
              ),
              Positioned(
                top: 155 ,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: TextButton(
                    onPressed: (){
                      Prefs.setBool(KisOnboardingViewSeen, true);
                      Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text("تخطي")),
              ),
            ],
          ),
          SizedBox(height: 19,),
          title,
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Text(subTitle,
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.greyColor
              ),
            textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}