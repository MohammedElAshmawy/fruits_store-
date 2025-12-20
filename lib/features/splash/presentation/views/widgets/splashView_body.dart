import 'package:e_commerce/core/services/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart' show OnBoardingView;
import 'package:e_commerce/gen/assets.gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}


class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      executeNavigation();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets().splash),
            ],
          ),
          SvgPicture.asset(AppAssets().logo),
          SvgPicture.asset(AppAssets().bottomSplash,fit: BoxFit.fill,),
        ],
      ),
    );
  }

  void executeNavigation() async {
    bool isOnboardingSeen = Prefs.getBool(KisOnboardingViewSeen);
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (isOnboardingSeen == true) {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    }
    else {
      Navigator.pushReplacementNamed(context, OnBoardingView.routName);
    }
  }
}


