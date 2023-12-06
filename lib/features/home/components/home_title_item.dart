import 'package:flutter/material.dart';
import 'package:kreez/core/utils/get_size.dart';

import '../../../core/utils/app_colors.dart';

class HomeTitleItem extends StatelessWidget {
  final String title;
 final void Function()? moreOnTap;
  const HomeTitleItem({super.key,required this.title,this.moreOnTap});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: getSize(context)*0.04,
              height: getSize(context)*0.09,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )
              ),
            ),
            const SizedBox(width: 6,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.black,

              ),),
            ),
          ],
        ),
        InkWell(
          onTap: moreOnTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("المزيد",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary
            ),),
          ),
        ),

      ],
    );
  }
}
