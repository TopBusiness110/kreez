import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/decoded_image.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
 final ProductModel? productModel;
  const ProductDetailsScreen({Key? key, this.productModel}) : super(key: key);

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
                    child: Text("product_details".tr(),style: Theme.of(context).textTheme.bodyLarge),
                  ),),


                ],
              ),
            ),
            DecodedImage2(base64String:productModel?.image, ),
            SizedBox(height: 5.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${productModel?.name}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black1
                  ),),
                  SizedBox(width: 20,),
                  Text("${productModel?.unit}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black1
                  ),),
                  Text("/${productModel?.price}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black1
                  ),),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width:5.w,
                    height: 2.5.h,
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
                    width:7.w,
                    height: 3.2.h,
                    decoration:BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("2 ${productModel?.unit?.substring(0,2).toString()}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.primary,
                        fontSize: 12
                    )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width:5.w,
                    height: 2.5.h,
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
            ),
            SizedBox(height: 5.h,),
            Text("${productModel?.details}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.black1
            ),),

          ],
        ),
    );
  }
}
