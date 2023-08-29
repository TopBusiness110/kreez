import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});


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
                Row(children: [Text("new_account".tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),)],),
                Image.asset(ImageAssets.kreezImage,width:width*0.6 ,height: height*0.3,),

                CustomTextField(title: "full_name".tr(), textInputType: TextInputType.emailAddress,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.person_2_outlined,color: AppColors.primary,) ,),

                CustomTextField(title: "phone".tr(), textInputType: TextInputType.emailAddress,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.phone_outlined,color: AppColors.primary,) ,),


                CustomTextField(title: "email".tr(), textInputType: TextInputType.emailAddress,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.email_outlined,color: AppColors.primary,) ,),
                //  SizedBox(height: height*0.1,),

                CustomTextField(title: "password".tr(), textInputType: TextInputType.text,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                  suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),

                SizedBox(height: height*0.04,),
                CustomButton(
                    width: width*0.7,
                    backgroundColor: AppColors.primary, textColor: AppColors.white,
                    text: "register".tr(), onPressed: (){}),
                SizedBox(height: height*0.01,),


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
