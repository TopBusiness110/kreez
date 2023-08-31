import 'package:flutter/material.dart';

import 'package:kreez/features/home/screens/home_screen.dart';
import 'package:kreez/features/onboarding/screens/onboarding.dart';
import 'package:kreez/features/profile_feature/change_password/screens/change_password_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication_feature/forgot_password/screeens/forgot_password_screen.dart';
import '../../features/authentication_feature/login/screens/login_screen.dart';
import '../../features/authentication_feature/new_password/screens/new_password_screen.dart';
import '../../features/authentication_feature/otp/screens/otp_screen.dart';
import '../../features/authentication_feature/register/screens/register_screen.dart';
import '../../features/profile_feature/edit_profile/screens/edit_profile_screen.dart';
import '../../features/splash/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String otpRoute = '/otp';
  static const String newPasswordRoute = '/newPassword';
  static const String homeRoute = '/home';
  static const String editProfileRoute = '/editProfile';
  static const String changePasswordRoute = '/changePassword';

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

      case Routes.otpRoute:
        return MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        );

      case Routes.newPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) =>  const HomeScreen(),
        );

      case Routes.editProfileRoute:
        return MaterialPageRoute(
          builder: (context) =>  const EditProfileScreen(),
        );

      case Routes.changePasswordRoute:
        return MaterialPageRoute(
          builder: (context) =>  const ChangePasswordScreen(),
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
