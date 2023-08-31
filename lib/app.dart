import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';
import 'config/routes/app_routes.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'package:kreez/injector.dart' as injector;

import 'features/profile_feature/orders_history/cubit/order_history_cubit.dart';

class Kreez extends StatefulWidget {
  const Kreez({Key? key}) : super(key: key);

  @override
  State<Kreez> createState() => _KreezState();
}

class _KreezState extends State<Kreez> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

     return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.serviceLocator<HomeCubit>(),),
        BlocProvider(
          create: (_) => injector.serviceLocator<OrderHistoryCubit>(),
        ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<HomeCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<PostsCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<ProfileCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<FavoriteCubit>(),
    //     // ),
    //     //
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<PrivacyCubit>(),
    //     // ),
    //     //
    //     //
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<AddServiceCubit>(),
    //     // ),
    //
    //
    //
      ],
        child: GetMaterialApp(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              fontFamily: "Cairo"
            ),
              bodySmall: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontFamily: "Cairo"
              ),
              bodyLarge: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  fontFamily: "Cairo"
              ),
            displayLarge: TextStyle(
                fontFamily: "Cairo",
              fontWeight: FontWeight.w600,
              color: AppColors.black1,
              fontSize: 24
            ),
              displayMedium: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                  color: AppColors.black1,
                  fontSize: 18
              )

          )
        ),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
        // standard dark theme
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        )
    );
  }
}
