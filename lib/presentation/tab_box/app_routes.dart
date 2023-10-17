import 'package:coffeelito/presentation/on_boarding/on_boarding_screen.dart';
import 'package:coffeelito/presentation/splash/splash_screen.dart';
import 'package:coffeelito/presentation/tab_box/home/home_screen.dart';
import 'package:coffeelito/presentation/tab_box/home/widgets/product_detail_screen.dart';
import 'package:coffeelito/presentation/tab_box/tab_box.dart';
import 'package:flutter/material.dart';


class RouteNames {
  static const String homeScreen = "/home";
  static const String onBoarding = "/on_boarding";
  static const String splashScreen = "/";
  static const String tabBox = "/tab_box";
  static const String detailScreen = "/detail_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.detailScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => TabBox(),
        );
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
