import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokemon/ui/Pages/AnimationPage/AnimationPage.dart';
import 'package:pokemon/ui/Pages/HomePage/HomePage.dart';
import 'package:pokemon/ui/Pages/PokemonsPage/PokemonsPage.dart';
import 'package:pokemon/ui/Pages/SplashScreenPage/splash_screen.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splashScreen';
  static const String homePage = '/homePage';
  static const String animationPage = '/animationPage';
  static const String pokemonsPage = '/pokemonsPage';

  static Route? getRoutes(settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case homePage:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case animationPage:
        return PageTransition(
          child: AnimationPage(
            arguments: settings.arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case pokemonsPage:
        return PageTransition(
          child: const PokemonsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      default:
        return null;
    }
  }
}

class StringArguments {
  String? name;
  StringArguments({
    this.name,
  });
}
