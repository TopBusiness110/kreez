import 'package:easy_localization/easy_localization.dart'as easy;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? lang = easy.EasyLocalization.of(context)?.locale.countryCode;
    return  SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
       // color: Colors.lightBlue,
        height: 88.h,
        child: Column(
          children: [
            Container(
              width: double.infinity,
               height:15.h,
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Column(

                children: [
                  SizedBox(height: 0.1.h,),
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
                    child: Text("cart".tr(),style: Theme.of(context).textTheme.bodyLarge),
                  ),),

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8),
                    child: Stack(
                      children: [
                        Card(
                          child: Column(

                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                                leading: Image.asset("assets/images/strawberry.png",),

                                title: Padding(
                                  padding:  EdgeInsets.only(left: 25.w),
                                  child: Column(
                                    children: [
                                      Text("strawberry",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: AppColors.black1
                                      )),
                                      Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width:7.w,
                                            height: 3.3.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightGreen,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: AppColors.primary)
                                            ),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                                icon: Icon(Icons.add,size: 15,color: AppColors.primary,),

                                                onPressed: (){}),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            width:7.7.w,
                                            height: 3.8.h,
                                            decoration:BoxDecoration(
                                              color: AppColors.lightGreen,
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Text("2 ك",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                color: AppColors.primary,
                                              fontSize: 12
                                            )),
                                          ),

                                          Container(
                                            alignment: Alignment.center,
                                            width:7.w,
                                            height: 3.3.h,
                                            decoration: BoxDecoration(
                                                color: AppColors.lightGreen,
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(color: AppColors.primary)
                                            ),
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: Icon(Icons.remove,size: 15,color: AppColors.primary,),

                                                onPressed: (){}),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Text("20 ج / ك",
                                    textDirection: TextDirection.ltr,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: AppColors.primary
                                    )),
                              ),

                            ],
                          ),
                        ),
                        Positioned(
                          left: -10,
                          top:-10,
                          child: IconButton(
                            icon: Icon(Icons.close_rounded,color: AppColors.red,size: 15,) ,
                            onPressed: (){},),
                        )
                      ],
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}

