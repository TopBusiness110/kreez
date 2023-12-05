import 'package:flutter/material.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/features/cart/screens/cart_screen.dart';
import 'package:kreez/features/cart/screens/redirect_to_sign.dart';
import 'package:kreez/features/categories/screen/all_categories_screen.dart';

import 'package:kreez/features/home/screens/home_screen.dart';
import 'package:kreez/features/onboarding/screens/onboarding.dart';
import 'package:kreez/features/product_details/models/product_model.dart';
import 'package:kreez/features/product_details/screens/product_details_screen.dart';
import 'package:kreez/features/products/screens/products_screen.dart';
import 'package:kreez/features/profile_feature/change_password/screens/change_password_screen.dart';
import 'package:kreez/features/search_home/screens/home_search_screen.dart';
import '../../core/models/all_products_model.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication_feature/forgot_password/screeens/forgot_password_screen.dart';
import '../../features/authentication_feature/login/screens/login_screen.dart';
import '../../features/authentication_feature/new_password/screens/new_password_screen.dart';
import '../../features/authentication_feature/otp/screens/otp_screen.dart';
import '../../features/authentication_feature/register/screens/register_screen.dart';
import '../../features/profile_feature/edit_profile/screens/edit_profile_screen.dart';
import '../../features/profile_feature/orders_history/screens/orders_history_screen.dart';
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
  static const String ordersHistoryRoute = '/ordersHistory';
  static const String productDetailsRoute = '/productDetails';
  static const String categoriesRoute = '/categories';
  static const String productsRoute = '/products';
  static const String cartRoute = '/cart';
  static const String homeSearchRoute = '/homeSearch';
  static const String redirectToSignInRoute = '/redirectUserScreen';

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
          builder: (context) =>  LoginScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) =>  RegisterScreen(),
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

      case Routes.ordersHistoryRoute:
        return MaterialPageRoute(
          builder: (context) =>  const OrdersHistoryScreen(),
        );
      case Routes.productDetailsRoute:
        var args = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) =>   ProductDetailsScreen(productModel: args),
        );

      case Routes.categoriesRoute:
        var args = settings.arguments as AllCategoriesModel;
        return MaterialPageRoute(
          builder: (context) =>   CategoriesScreen(allCategoriesModel: args),
        );

     // case Routes.productsRoute:
        //
        // var args = settings.arguments as AllCategoriesModel;
        // return MaterialPageRoute(
        //   builder: (context) =>   ProductsScreen(allCategoriesModel: args),
        // );
      case Routes.productsRoute:

        var args = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (context) =>   ProductsScreen(allCategoriesModel: args[0],id:args.length>1?args[1]:0),
        );

      case Routes.homeSearchRoute:

        return MaterialPageRoute(
          builder: (context) =>   HomeSearchScreen(),
        );

      case Routes.cartRoute:
        return MaterialPageRoute(
          builder: (context) =>  const CartScreen(),
        );

      case Routes.redirectToSignInRoute:
        return MaterialPageRoute(
          builder: (context) =>  const RedirectToSignUp(),
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
