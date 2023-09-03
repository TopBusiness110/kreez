import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.w,
        decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(20)
        ),
        child:Column(
          children: [
            Visibility(
              visible: true,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    // height: 3.5.h,
                    // width: 25.w,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                    ),
                    child:Row(
                      children: [
                        Text("10%",style: Theme.of(context).textTheme.bodySmall,),
                        Text(" تخفيض",style: Theme.of(context).textTheme.bodySmall,),
                      ],
                    )
                  ),
                ],
              ),
            ),
            Image.asset(ImageAssets.strawberryImage,height: 8.h,fit: BoxFit.cover,),
            Text("فراولة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.black
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("فواكة",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontSize: 15
                ),),
                Text("20 ج / ك",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primary,
                    fontSize: 15
                ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    child: Text("2 ك",style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    ),
                    child: Icon(Icons.shopping_cart,color: AppColors.white,),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
