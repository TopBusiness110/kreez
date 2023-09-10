import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/profile_feature/orders_history/cubit/order_history_cubit.dart';

import '../../../../core/utils/assets_manager.dart';
import '../components/orders_history_list_item.dart';

class CompletedOrdersTab extends StatelessWidget {


  const CompletedOrdersTab({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        OrderHistoryCubit cubit = context.read<OrderHistoryCubit>();
        return ListView.builder(
          itemCount: cubit.draftOrders.length,
          itemBuilder: (context, index) {
            return OrdersHistoryListItem(
              label: "${cubit.draftOrders[index].state.toString().substring(6)}",
              date:  "${cubit.draftOrders[index].writeDate.toString()}",
              price: "${cubit.draftOrders[index].state}",
              quantity: "${cubit.draftOrders[index].amountTotal
              }",);
          },);
      },
    );
  }
}
