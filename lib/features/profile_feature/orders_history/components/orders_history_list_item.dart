import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Column(
         // contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("#$displayName",
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.primary
                  )),
            Text("${state}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary
            )),

          ],),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Text("${date}",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.black1
                )),
                Text("$amountTotal",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.black1
                )),
                // Text(price,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //     color: AppColors.primary
                // )),
              ],
            ),

          ],

        ),
      ),
    );
  }
}
