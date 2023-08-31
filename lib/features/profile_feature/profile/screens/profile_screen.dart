import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/utils/app_colors.dart';
import '../../../../config/routes/app_routes.dart';
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
    return SafeArea(
      child: Stack(
        children: [
          Container(width: double.infinity, height: height * 0.88),
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
            child: Container(
            //  height: height*0.7,
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
                        //To handle error and display error message
                        // Helper.errorSnackBar(
                        //     context: context, message: "Unable to open whatsapp");
                      }
                    }
                  },
                    child: ProfileListItem(height: height, width: width, icon: icons[index], label: labels[index]));
              },),
            ),
          )

        ],
      ),
    );
  }
}
