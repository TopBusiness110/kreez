import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';


class ProfileListItem extends StatelessWidget{
  final double width;
  final double height;
  final String label;
  final String icon;
  const ProfileListItem({super.key,required this.height,required this.width ,
  required this.icon ,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20,vertical: 10
      ),
      // width: width*0.9,
      height: height * 0.08,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 2,spreadRadius: 0,offset: Offset(1,1))],

        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        //  border: Border.all(color: AppColors.gray.withOpacity(0.5),width: 0.5)
      ),
      child: Row(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(icon),
          ),
          Text(label,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.black1
          ),).tr(),

        //  Image.asset(icon)
        ],
      ),

    );
  }
}