import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets_manager.dart';
import '../components/orders_history_list_item.dart';
import '../cubit/order_history_cubit.dart';

class NextOrdersTab extends StatelessWidget {
  const NextOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        OrderHistoryCubit cubit = context.read<OrderHistoryCubit>();
        return ListView.builder(
          itemCount: cubit.otherOrders.length,
          itemBuilder: (context, index) {
            return OrdersHistoryListItem(
                label: "${cubit.otherOrders[index].state.toString().substring(6)}",
                date:  cubit.otherOrders[index].writeDate.toString(),
                price: "${cubit.otherOrders[index].state}",
                quantity: "${cubit.otherOrders[index].amountTotal}"
            );
          },

        );
      },
    );
  }
}
