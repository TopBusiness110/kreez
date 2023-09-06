import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/config/routes/app_routes.dart';
import 'package:kreez/core/api/base_api_consumer.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:kreez/core/widgets/custom_button.dart';
import 'package:kreez/core/widgets/custom_textfield.dart';
import 'package:kreez/features/authentication_feature/login/cubit/login_cubit.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../core/widgets/copyright.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>(debugLabel: "login key");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginFailureState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error occured while login process"),duration: Duration(seconds: 1),));
        }
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context,
              Routes.homeRoute); //todo plz chane it to push replacement
        }

      },
      builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "login".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Image.asset(
                        ImageAssets.kreezImage,
                        width: width * 0.6,
                        height: height * 0.3,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          validatorMessage: "Enter phone or mail",
                          controller: cubit.phoneOrMailController,
                          title: "phone_or_mail".tr(),
                          textInputType: TextInputType.emailAddress,
                          backgroundColor: AppColors.lightGreen,
                          textColor: AppColors.black2,
                          prefixWidget: Icon(
                            Icons.email_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      //  SizedBox(height: height*0.1,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          validatorMessage: "Enter Password",
                          controller: cubit.passwordController,
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
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.forgotPasswordRoute);
                              },
                              child: Text(
                                "forgot_password".tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.red),
                                textAlign: TextAlign.start,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomButton(
                          width: width * 0.7,
                          backgroundColor: AppColors.primary,
                          textColor: AppColors.white,
                          text: "login".tr(),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              //todo--> login as true user
                              await cubit.loginAsTrueUser2(context);
                            }
                          }),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.registerRoute);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () async {},
                                child: Text(
                                  "have_no_account".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.black),
                                  textAlign: TextAlign.start,
                                )),
                            Text(
                              "create_account".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.red),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context,
                            Routes.homeRoute);
                      }, child: Text("as_guest".tr(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primary
                      ),)),
                      SizedBox(
                        height: height * 0.05,
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
