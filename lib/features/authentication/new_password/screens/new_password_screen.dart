import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/widgets/custom_arrow_back.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});


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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("new_password".tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                    CustomArrowBack(),
                  ],),

                Image.asset(ImageAssets.kreezImage,width:width*0.6 ,height: height*0.3,),


                //  SizedBox(height: height*0.1,),

                CustomTextField(title: "new_password".tr(), textInputType: TextInputType.text,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                  suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),

                CustomTextField(title: "confirm_password".tr(), textInputType: TextInputType.text,
                  backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                  prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                  suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),



                SizedBox(height: height*0.04,),
                CustomButton(
                    width: width*0.7,
                    backgroundColor: AppColors.primary, textColor: AppColors.white,
                    text: "confirm".tr(), onPressed: (){
                      Navigator.pushNamed(context, Routes.homeRoute);
                }),

                SizedBox(height: height*0.3,),

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
