import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/utils/get_size.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_arrow_back.dart';
import '../../../core/widgets/custom_button.dart';

class RedirectToSignUp extends StatelessWidget {
  const RedirectToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Spacer(),
                CustomArrowBack(),
              ],
            ),
            Spacer(),
            Text("not_registered".tr(),style: TextStyle(
              color: Colors.black
            ),),
            Spacer(),
            Image.asset(ImageAssets.notRegisteredImage),
                Spacer(),
            CustomButton(
                width: getSize(context) * 0.7,
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                text: "login".tr(),
                onPressed: () async {

              Navigator.pushReplacementNamed(context, Routes.loginRoute);

                }),
            Flexible(
              flex: 3,
                child: SizedBox()),
          ]
        ),
      ),
    );
  }
}
