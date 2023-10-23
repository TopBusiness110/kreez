import 'package:easy_localization/easy_localization.dart'as oo;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreez/core/utils/app_colors.dart';


class OrdersHistoryListItem extends StatelessWidget {
  const OrdersHistoryListItem({Key? key,required this.displayName,

            required this.state,required this.amountTotal,required this.date}) : super(key: key);
  final String displayName ;
  final String state ;
 // final String image ;
  final String amountTotal ;
  final String date ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
         // contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          children: [
            SizedBox(height: 10,),
          Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              Text("order_number".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.grey
              )),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 9),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text("${state}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary
              )),
            ),
              SizedBox(width: 10,),

          ],),
            Row(
              children: [
                SizedBox(width: 10,),
                SvgPicture.asset("assets/icons/books.svg"),
                SizedBox(width: 3,),
                Text("#$displayName",
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.black
                    )),
              ],
            ),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("order_date".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.grey
              )),
            ],
          ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10,),
                SvgPicture.asset("assets/icons/calender.svg"),
                SizedBox(width: 3,),
                Text("${date}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.black1
                )),
                Spacer(),

                Text("total".tr(),style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primary
                )),
                Text("$amountTotal",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.black1
                )),
                SizedBox(width: 10,)
              ],
            ),

          ],

        ),
      ),
    );
  }
}
