import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/profile_feature/orders_history/components/orders_history_list_item.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/get_size.dart';
import '../cubit/order_history_cubit.dart';

class PreviousOrdersTab extends StatelessWidget {
  const PreviousOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        OrderHistoryCubit cubit = context.read<OrderHistoryCubit>();
        return Column(
          children: [
            SizedBox(
              height: getSize(context) * 1.55,
              child: ListView.builder(
                itemCount: cubit.otherOrders.length,
                itemBuilder: (context, index) {
                  return OrdersHistoryListItem(
                    displayName: "${cubit.otherOrders[index].displayName}",
                    date:  "${cubit.otherOrders[index].writeDate.toString().toString().substring(0,10)}",
                    state: "${cubit.otherOrders[index].state.toString().substring(6)}",
                    amountTotal: "${cubit.otherOrders[index].amountTotal}",
                  );
                },

              ),
            ),
            SizedBox(height: getSize(context) * 0.1,)
          ],
        );
      },
    );
  }
}
