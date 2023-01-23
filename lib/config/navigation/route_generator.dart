import 'package:flutter/material.dart';

import 'package:weight_tracker/modules/auth/view/screens/auth_screen.dart';
import 'package:weight_tracker/modules/home/view/screens/home_screen.dart';
import 'package:weight_tracker/modules/splash/view/screens/splash_screen.dart';
import 'package:weight_tracker/modules/weights/view/screens/all_weights_Screen.dart';
import '../../core/view/views.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    // final Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Routes.splashScreen:
        return platformPageRoute(const SplashScreen());
      case Routes.authScreen:
        return platformPageRoute(const AuthScreen());
      case Routes.homeScreen:
        return platformPageRoute(const HomeScreen());
      case Routes.allWeightsScreen:
        return platformPageRoute(const AllWeightsScreen());
      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
