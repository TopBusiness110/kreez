import 'package:flutter/material.dart';
import 'package:kreez/core/models/login_response_model.dart';import 'package:kreez/core/preferences/preferences.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/core/utils/assets_manager.dart';

import '../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    initialization();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.secondPrimary,
                 AppColors.primary,

          ]),
        ),
        child: Stack(
          children: [
            Center(
            child:
              Image.asset(ImageAssets.splashImage),),
           // Spacer(),
           Align(
             alignment: Alignment.bottomCenter,
               child: Image.asset(ImageAssets.copyrightSplashImage,width: 150,height: 100,)),
          ],
        ),
      ),
    );
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    await Future.delayed(const Duration(seconds: 1));
   bool? firstTime = await Preferences.instance.getOnBoardingFirstTime();
    print('ready in 2...');
    // await Future.delayed(const Duration(seconds: 1));
    // print('ready in 1...');
    // await Future.delayed(const Duration(seconds: 1));
    // print('go!');
   // FlutterNativeSplash.remove();
    if(firstTime==null||firstTime==false){
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    }
    else{
      bool? isAdmin = await Preferences.instance.getIsAdmin();
      if(isAdmin==true||isAdmin==null){
        // if admin--> go to login
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
     else{
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }
      //if not admin means real user -->gp to home
    }
  }
}
