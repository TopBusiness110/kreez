import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/widgets/custom_arrow_back.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});


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
                    child: Text("edit_profile".tr(),style: Theme.of(context).textTheme.bodyMedium),
                  ),),
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.gray.withOpacity(0.3),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.gray,
                    )),
                Positioned(
                  top: height*0.06,
                    right: -5,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_rounded,color: AppColors.primary,)))
              ],
            ),
           SizedBox(height: height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
              child: CustomTextField(title: "محمد محمود".tr(), textInputType: TextInputType.emailAddress,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.person_outline_outlined,color: AppColors.primary,) ,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: CustomTextField(title: "01050487506".tr(), textInputType: TextInputType.emailAddress,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.phone_outlined,color: AppColors.primary,) ,),
            ),
            //  SizedBox(height: height*0.1,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: CustomTextField(title: "moh@admin.com".tr(), textInputType: TextInputType.text,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.email_outlined,color: AppColors.primary,) ,
               // suffixWidget: Icon(Icons.remove_red_eye_outlined,color: AppColors.primary,)
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: CustomTextField(title: "شبين الكوم".tr(), textInputType: TextInputType.emailAddress,
                backgroundColor: AppColors.lightGreen, textColor: AppColors.black2,
                prefixWidget: Icon(Icons.home_outlined,color: AppColors.primary,) ,),
            ),
           SizedBox(height: height*0.06,),
            CustomButton(
                width: width*0.7,
                backgroundColor: AppColors.primary, textColor: AppColors.white,
                text: "update".tr(), onPressed: (){}),
            SizedBox(height: height*0.1,)


          ],
        ),
      ),
    );
  }
}
