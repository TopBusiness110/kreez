
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kreez/core/widgets/custom_arrow_back.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';
import '../../../../core/widgets/custom_button.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("enter_otp".tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                  CustomArrowBack(),
                ],),

              Image.asset(ImageAssets.kreezImage,width:width*0.6 ,height: height*0.3,),
              SizedBox(height: height*0.03,),
              //otp fields
              SizedBox(
                width: width,
                child: OtpTextField(
                  numberOfFields: 6,
                  cursorColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  focusedBorderColor: AppColors.primary,
                 // styles: otpTextStyles,
                  showFieldAsBox: false,
                  borderWidth: 2.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here if necessary
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {

                  },
                ),
              ),
              Spacer(),
              CustomButton(
                  width: width*0.7,
                  backgroundColor: AppColors.primary, textColor: AppColors.white,
                  text: "next".tr(), onPressed: (){
                Navigator.pushNamed(context, Routes.newPasswordRoute);
              }),



              Spacer(flex: 2,),
              CopyrightWidget(width: width,)
            ],
          ),
        ),
      ),
    );
  }
}
