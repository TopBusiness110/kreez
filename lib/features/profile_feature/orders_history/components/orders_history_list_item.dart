import 'package:flutter/material.dart';
import 'package:kreez/core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';

class OrdersHistoryListItem extends StatelessWidget {
  const OrdersHistoryListItem({Key? key,required this.label,
    //required this.image,
            required this.price,required this.quantity,required this.date}) : super(key: key);
  final String label ;
  final String price ;
 // final String image ;
  final String quantity ;
  final String date ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          leading: Text(date,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primary
          )),

          title: Column(
            children: [
              Text("state",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary
              )),
              Text(label,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.black1
              )),
              // Text(price,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              //     color: AppColors.primary
              // )),
            ],
          ),
          trailing: Text(quantity,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.red
          )),
        ),
      ),
    );
  }
}
