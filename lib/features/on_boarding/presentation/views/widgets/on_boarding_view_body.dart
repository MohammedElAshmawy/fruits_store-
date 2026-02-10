import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/helper/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child:
            OnBoardingPageView(
                pageController: pageController
             )
            ),
            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(
                activeColor: AppColors.primaryColor,
                color: currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.unActivatedColor.withOpacity(.6),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Visibility(
                visible: currentPage == 1 ? true : false,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: CustomButton(onPressed: () {
                  Prefs.setBool(KisOnboardingViewSeen, true);
                  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                }, text: "ابدأ الان"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
