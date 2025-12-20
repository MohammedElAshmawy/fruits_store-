import 'package:e_commerce/core/helper/bloc_observer.dart';
import 'package:e_commerce/core/helper/go_route_function.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/services/shared_pref_singletone.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_View.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        primaryColor: AppColors.primaryColor,
        fontFamily: "Cairo",
      ),
      locale: Locale('ar'),
      // أو Locale('en')
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routName,
    );
  }
}