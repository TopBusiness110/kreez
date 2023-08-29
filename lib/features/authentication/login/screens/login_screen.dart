import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/core/widgets/custom_button.dart';
import 'package:kreez/core/widgets/custom_textfield.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
             Row(children: [Text("login".tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),)],),
              Image.asset(ImageAssets.kreezImage,width:width*0.6 ,height: height*0.3,),

            CustomTextField(title: "email".tr(), textInputType: TextInputType.emailAddress,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
              prefixWidget: Icon(Icons.email_outlined,color: AppColors.primary,) ,),
            //  SizedBox(height: height*0.1,),

              CustomTextField(title: "password".tr(), textInputType: TextInputType.text,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {

                  }, child: Text("forgot_password".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.red
                  ),textAlign: TextAlign.start,)),
                ],
              ),
              SizedBox(height: height*0.04,),
              CustomButton(
                width: width*0.7,
                  backgroundColor: AppColors.primary, textColor: AppColors.white,
                  text: "login".tr(), onPressed: (){}),
              SizedBox(height: height*0.01,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.registerRoute);
                },
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {

                        }, child: Text("have_no_account".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black
                    ),textAlign: TextAlign.start,)),
                    Text("create_account".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.red
                    ),textAlign: TextAlign.start,),

                  ],
                ),
              ),
              SizedBox(height: height*0.2,),
              //Spacer(),
              CopyrightWidget(width: width,)
     ],
   ),
          ),
        ),
      ),
    );
  }
}
