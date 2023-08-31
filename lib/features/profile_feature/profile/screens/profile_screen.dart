import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../config/routes/app_routes.dart';
import '../../orders_history/screens/orders_history_screen.dart';
import '../components/profile_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  final List<String> icons = ["assets/icons/password.svg","assets/icons/support.svg","assets/icons/orders.svg",
    "assets/icons/privacy.svg","assets/icons/logout.svg","assets/icons/delete.svg"];
  final List<String> labels=["change_password","support","order_history","privacy","logout","delete_account"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(width: double.infinity, height: height * 0.88),
        Container(
          height: height * 0.2,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("my_account".tr()),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfileRoute);
                },
                icon: Icon(
                  Icons.mode_edit_outline_rounded,
                  color: AppColors.white,
                ))
          ],
        ),
        //the first big container
        Positioned(
          top: height * 0.09,
          right: 0,
          left: 0,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            // width: width*0.9,
            height: height * 0.2,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: AppColors.black1, blurRadius: 3)],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              //  border: Border.all(color: AppColors.gray.withOpacity(0.5),width: 0.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.gray.withOpacity(0.3),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.gray,
                    )),
                Text(
                  "محمد محمود",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColors.black1),
                ),
                Text(
                  "01050487506",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height*0.3,
          right: 0,
          left: 0,
          bottom: 3,
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if(index==0){
                  Navigator.pushNamed(context, Routes.changePasswordRoute);
                }
                else if(index==1){
                  var whatsappUrl =  "whatsapp://send?phone=+201011827324" +
                      "&text=${Uri.encodeComponent("kreez app support team ")}";
                      // "whatsapp://send?phone=${_countryCodeController.text + _phoneController.text}" +
                      //     "&text=${Uri.encodeComponent(_messageController.text)}";
                  try {
                    launch(whatsappUrl);
                  } catch (e) {
                    print("unable to open whatsapp");

                  }
                }
                else if(index==2){
                  Navigator.pushNamed(context, Routes.ordersHistoryRoute);
                }
                else if(index==3){

                }
                else if(index==4){
                  showLogoutAlertDialog(context);
                }
                else if(index==5){
                  showDeleteAlertDialog(context);
                 }
              },
                child: ProfileListItem(height: height, width: width, icon: icons[index], label: labels[index]));
          },),
        )

      ],
    );
  }
   void showDeleteAlertDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)),
           backgroundColor: AppColors.white,
           actionsAlignment: MainAxisAlignment.spaceBetween,
           title: Center(
             child: Text(
               "delete_account".tr(),
               style: Theme.of(context).textTheme.displayLarge!.copyWith(
                 color: AppColors.primary,
               ),
             ),
           ),
           content: Text(
             "sure_delete_account".tr(),
             style: Theme.of(context)
                 .textTheme
                 .displayMedium!
                 .copyWith(color: AppColors.primary, fontSize: 14),
           ),
           actions: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.pop(context);

                 },
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size(30.w, 5.h),
                   maximumSize: Size(33.w, 6.h),
                   backgroundColor: AppColors.red,
                 ),
                 child: Text(
                   "yes_delete".tr(),
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child: ElevatedButton(

                 onPressed: () {
                   Navigator.pop(context);
                 },
                 style: ElevatedButton.styleFrom(

                   backgroundColor: AppColors.primary,
                   minimumSize: Size(30.w, 5.h),
                   maximumSize: Size(33.w, 6.h),
                 ),
                 child: Text(
                   "no".tr(),
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
               ),
             ),
           ],
         );
       },
     );
   }

   void showLogoutAlertDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)),
           backgroundColor: AppColors.white,
           actionsAlignment: MainAxisAlignment.spaceBetween,
           title: Center(
             child: Text(
               "logout".tr(),
               style: Theme.of(context).textTheme.displayLarge!.copyWith(
                 color: AppColors.primary,
               ),
             ),
           ),
           content: Text(
             "sure_logout".tr(),
             style: Theme.of(context)
                 .textTheme
                 .displayMedium!
                 .copyWith(color: AppColors.primary, fontSize: 14),
           ),
           actions: [
             Padding(
               padding: const EdgeInsets.only(right: 8.0),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.pop(context);

                 },
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size(30.w, 5.h),
                   maximumSize: Size(33.w, 6.h),
                   backgroundColor: AppColors.red,
                 ),
                 child: Text(
                   "yes".tr(),
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child: ElevatedButton(

                 onPressed: () {
                   Navigator.pop(context);
                 },
                 style: ElevatedButton.styleFrom(

                   backgroundColor: AppColors.primary,
                   minimumSize: Size(30.w, 5.h),
                   maximumSize: Size(33.w, 6.h),
                 ),
                 child: Text(
                   "no".tr(),
                   style: Theme.of(context).textTheme.bodySmall,
                 ),
               ),
             ),
           ],
         );
       },
     );
   }
}