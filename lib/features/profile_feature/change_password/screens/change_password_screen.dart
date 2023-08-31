import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              width: double.infinity,
              // height: height*0.19,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Column(

                children: [
                  SizedBox(height: height*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Transform.rotate(
                            angle: lang == "en" ? 0 : (3.14),
                            child:  Icon(
                              Icons.arrow_back_outlined,
                              size: 30,
                              color: AppColors.white,
                            ),
                          )),
                    ],
                  ),
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("change_password".tr(),style: Theme.of(context).textTheme.bodyMedium),
                  ),),
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
              child:
              CustomTextField(title: "current_password".tr(), textInputType: TextInputType.text,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
              child:
              CustomTextField(title: "new_password".tr(), textInputType: TextInputType.text,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
              child:
              CustomTextField(title: "confirm_password".tr(), textInputType: TextInputType.text,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.lock_open_outlined,color: AppColors.primary,) ,
                suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)  ,),
            ),
            SizedBox(height: height*0.06,),
            CustomButton(
                width: width*0.8,
                backgroundColor: AppColors.primary, textColor: AppColors.white,
                text: "confirm".tr(), onPressed: (){
                  Navigator.pop(context);
            }),
            SizedBox(height: height*0.1,)


          ],
        ),
      ),
    );
  }
}
