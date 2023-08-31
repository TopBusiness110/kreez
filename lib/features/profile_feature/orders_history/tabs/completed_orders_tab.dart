import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../components/orders_history_list_item.dart';

class CompletedOrdersTab extends StatelessWidget {
  const CompletedOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
      return OrdersHistoryListItem(label: "بطيخ",image: ImageAssets.watermelonImage,
      price: "20 ج / ك",quantity: "2 kg",);
    },);
  }
}
