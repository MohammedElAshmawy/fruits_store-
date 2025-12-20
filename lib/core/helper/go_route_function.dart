import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_View.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){

  switch(settings.name){
    case SplashView.routName:
      return MaterialPageRoute(builder: (context)=> const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context)=> const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context)=> const SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context)=> const HomeView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context)=> const BestSellingView());
    case OnBoardingView.routName:
      return MaterialPageRoute(builder: (context)=> const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context)=> const Scaffold());
  }
}