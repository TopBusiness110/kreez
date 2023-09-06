import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart'as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/widgets/custom_arrow_back.dart';
import 'package:kreez/features/authentication_feature/register/cubit/register_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/copyright.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>(debugLabel: "register key");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = easy.EasyLocalization.of(context)?.locale.countryCode;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error occured while register process"),
            duration: Duration(seconds: 1),
          ));
        }
        if (state is RegisterSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = context.read<RegisterCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "new_account".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          CustomArrowBack(),
                        ],
                      ),

                      Image.asset(
                        ImageAssets.kreezImage,
                        width: width * 0.6,
                        height: height * 0.3,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            //full name
                            CustomTextField(
                              validatorMessage: "Enter Full name",
                              controller: cubit.fullNameController,
                              title: "full_name".tr(),
                              textInputType: TextInputType.emailAddress,
                              backgroundColor: AppColors.lightGreen,
                              textColor: AppColors.black2,
                              prefixWidget: Icon(
                                Icons.person_2_outlined,
                                color: AppColors.primary,
                              ),
                            ),
                            // phone number
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    suffixWidget: SizedBox(
                                      height: 40,
                                      width: width * 0.2,
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: CountryCodePicker(
                                          hideMainText: false,
                                          onChanged: (CountryCode countryCode) {
                                            cubit.selectedCountryCode =
                                                countryCode;
                                            //TODO : manipulate the selected country code here
                                            print("New Country selected: $countryCode");
                                          },
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          initialSelection: 'eg',
                                          favorite: ['+2', 'eg'],
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
                                    ),
                                    controller: cubit.phoneController,
                                    validatorMessage: "Enter Phone number",
                                    title: "phone".tr(),
                                    textInputType: TextInputType.number,
                                    backgroundColor: AppColors.lightGreen,
                                    textColor: AppColors.black2,
                                    prefixWidget: Icon(
                                      Icons.phone_outlined,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 60,
                                //   width: width * 0.2,
                                //   child: CountryCodePicker(
                                //     hideMainText: false,
                                //     onChanged: (CountryCode countryCode) {
                                //       cubit.selectedCountryCode = countryCode;
                                //       //TODO : manipulate the selected country code here
                                //       print("New Country selected: " +
                                //           countryCode.toString());
                                //     },
                                //     // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                //     initialSelection: 'eg',
                                //     favorite: ['+2', 'eg'],
                                //     // optional. Shows only country name and flag
                                //     showCountryOnly: true,
                                //     // showFlagDialog: true,
                                //     showFlagMain: false,
                                //     // optional. Shows only country name and flag when popup is closed.
                                //     //showOnlyCountryWhenClosed: true,
                                //     // optional. aligns the flag and the Text left
                                //     alignLeft: false,
                                //   ),
                                // ),
                              ],
                            ),

                            // CustomTextField(
                            //   controller: cubit.cityController,
                            //   validatorMessage: "Enter City name",
                            //   title: "city".tr(),
                            //   textInputType: TextInputType.text,
                            //   backgroundColor: AppColors.lightGreen,
                            //   textColor: AppColors.black2,
                            //   prefixWidget: Icon(
                            //     Icons.home_outlined,
                            //     color: AppColors.primary,
                            //   ),
                            // ),
                            //  SizedBox(height: height*0.1,),
                            //password
                            CustomTextField(
                              controller: cubit.passwordController,
                              validatorMessage: "Enter password",
                              title: "password".tr(),
                              textInputType: TextInputType.text,
                              backgroundColor: AppColors.lightGreen,
                              textColor: AppColors.black2,
                              prefixWidget: Icon(
                                Icons.lock_open_outlined,
                                color: AppColors.primary,
                              ),
                              suffixWidget: Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.primary,
                              ),
                            ),

                            // CustomTextField(
                            //   controller: cubit.confirmPasswordController,
                            //   validatorMessage: "Enter password again",
                            //   title: "confirm_password".tr(),
                            //   textInputType: TextInputType.text,
                            //   backgroundColor: AppColors.lightGreen,
                            //   textColor: AppColors.black2,
                            //   prefixWidget: Icon(
                            //     Icons.lock_open_outlined,
                            //     color: AppColors.primary,
                            //   ),
                            //   suffixWidget: Icon(
                            //     Icons.remove_red_eye_outlined,
                            //     color: AppColors.primary,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      //email
                      CustomTextField(
                        controller: cubit.emailController,
                        validatorMessage: "Enter Email",
                        title: "email".tr(),
                        textInputType: TextInputType.emailAddress,
                        backgroundColor: AppColors.lightGreen,
                        textColor: AppColors.black2,
                        prefixWidget: Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                        ),
                      ),

                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomButton(
                          width: width * 0.7,
                          backgroundColor: AppColors.primary,
                          textColor: AppColors.white,
                          text: "register".tr(),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cubit.register2(context);
                            }
                          }),
                      SizedBox(
                        height: height * 0.04,
                      ),

                      //Spacer(),
                      CopyrightWidget(
                        width: width,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
