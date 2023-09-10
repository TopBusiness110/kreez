import 'package:flutter/material.dart';
import 'package:kreez/features/profile_feature/orders_history/components/orders_history_list_item.dart';

import '../../../../core/utils/assets_manager.dart';

class CanceledOrdersTab extends StatelessWidget{
  const CanceledOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {

        return OrdersHistoryListItem(label: "tomato", date: "12/10", price: "20 ج / ك", quantity: "3 kg");
      },

    );
  }
}
