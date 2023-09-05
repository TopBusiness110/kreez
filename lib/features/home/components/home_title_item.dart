import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class HomeTitleItem extends StatelessWidget {
  final String title;
  const HomeTitleItem({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 35,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )
              ),
            ),
            const SizedBox(width: 6,),
            Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.black,

            ),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("المزيد",style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primary
          ),),
        ),

      ],
    );
  }
}
