import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../core/models/all_categories_model.dart';
import '../../../core/widgets/decoded_image.dart';

class CategoriesScreen extends StatelessWidget {
 final AllCategoriesModel? allCategoriesModel;
  const CategoriesScreen({Key? key,this.allCategoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            //  height:15.h,
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Column(

              children: [
                SizedBox(height: 5.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius:22,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.gray1,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                          "مرحبا , محمد",
                          style: Theme.of(context).textTheme.bodySmall
                      ),
                    ],
                  ),
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("categories".tr(),style: Theme.of(context).textTheme.bodyLarge),
                ),),




              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                      mainAxisSpacing: 25,
                 ),
              itemCount: allCategoriesModel?.result?.length??0,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius:50,
                      //     backgroundColor: AppColors.primary,
                      //     child: CircleAvatar(
                      //         radius:48,
                      //         backgroundColor: AppColors.white,
                      //         child: Image.asset(ImageAssets.strawberryImage,height: 10.h,))),
                      DecodedImage(base64String:allCategoriesModel?.result?[index].image1920 ),
                      Text("${allCategoriesModel?.result?[index].displayName}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.black1,
                          fontSize: 15
                      ),)
                    ],
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}
