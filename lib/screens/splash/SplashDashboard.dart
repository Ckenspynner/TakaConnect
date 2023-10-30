
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:takaconnect/screens/home/home_screen.dart';
import 'package:takaconnect/screens/splash/components/SplashAnimation.dart';
import 'package:takaconnect/screens/splash/splash_screen.dart';


class SplashDashboard extends StatelessWidget {
  const SplashDashboard({Key? key}) : super(key: key);
  static String routeName = "/SplashDashboard";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: const SplashAnimationPage(),
        splashIconSize: 350,
        nextScreen: const HomeScreen(),//Text(SplashScreen.routeName),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: Colors.white);
  }
}

