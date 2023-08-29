import 'package:flutter/material.dart';
import 'package:kreez/features/authentication/forgot_password/screeens/forgot_password_screen.dart';
import 'package:kreez/features/authentication/login/screens/login_screen.dart';
import 'package:kreez/features/authentication/register/screens/register_screen.dart';
import 'package:kreez/features/onboarding/screens/onboarding.dart';


import '../../core/utils/app_strings.dart';
import '../../features/splash/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';

}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );



      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
