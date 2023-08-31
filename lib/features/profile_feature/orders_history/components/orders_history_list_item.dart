import 'package:flutter/material.dart';
import 'package:kreez/core/utils/app_colors.dart';

import '../../../../core/utils/assets_manager.dart';

class OrdersHistoryListItem extends StatelessWidget {
  const OrdersHistoryListItem({Key? key,required this.label,required this.image,
            required this.price,required this.quantity}) : super(key: key);
  final String label ;
  final String price ;
  final String image ;
  final String quantity ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
          leading: Image.asset(image),

          title: Column(
            children: [
              Text(label,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.black1
              )),
              Text(price,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary
              )),
            ],
          ),
          trailing: Text(quantity,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primary
          )),
        ),
      ),
    );
  }
}
