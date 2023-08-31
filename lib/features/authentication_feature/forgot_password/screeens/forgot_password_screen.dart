import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/widgets/custom_arrow_back.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("forgot_password".tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                  CustomArrowBack(),
                ],),
          Text("enter_phone_to_recover_pass".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.gray3
          ),),
              Image.asset(ImageAssets.kreezImage,width:width*0.6 ,height: height*0.3,),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: CustomTextField(title: "phone/email".tr(), textInputType: TextInputType.phone,
                        backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                        prefixWidget: Icon(Icons.phone_outlined,color: AppColors.primary,) ,),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width:  width*0.2,
                    child: CountryCodePicker(
                      hideMainText: false,
                      onChanged: (CountryCode countryCode) {
                        //TODO : manipulate the selected country code here
                        print("New Country selected: " + countryCode.toString());
                      },
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'eg',
                      favorite: ['+2','eg'],
                      // optional. Shows only country name and flag
                      showCountryOnly: true,
                      // showFlagDialog: true,
                      showFlagMain: false,
                      // optional. Shows only country name and flag when popup is closed.
                      //showOnlyCountryWhenClosed: true,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,

                    ),
                  ),
                ],
              ),



              SizedBox(height: height*0.03,),
              CustomButton(
                  width: width*0.7,
                  backgroundColor: AppColors.primary, textColor: AppColors.white,
                  text: "send".tr(), onPressed: (){
                    Navigator.pushNamed(context, Routes.otpRoute);
              }),



              Spacer(),
              CopyrightWidget(width: width,)
            ],
          ),
        ),
      ),
    );
  }
}
