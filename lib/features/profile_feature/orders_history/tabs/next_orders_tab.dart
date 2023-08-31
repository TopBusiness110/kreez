import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../components/orders_history_list_item.dart';

class NextOrdersTab extends StatelessWidget {
  const NextOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {

        return OrdersHistoryListItem(label: "strawberry", image: ImageAssets.strawberryImage, price: "20 ج / ك", quantity: "4 kg");
      },

    );
  }
}
