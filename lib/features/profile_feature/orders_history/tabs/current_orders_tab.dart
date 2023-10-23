import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/utils/get_size.dart';
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
        return
        ListView(
          children: [
        SizedBox(
          height: getSize(context)*1.45,
          child: ListView.builder(
          itemCount: cubit.draftOrders.length,
            itemBuilder: (context, index) {
              return OrdersHistoryListItem(
                displayName: "${cubit.draftOrders[index].displayName}",
                date:  "${cubit.draftOrders[index].writeDate.toString().toString().substring(0,10)}",
                state: "${cubit.draftOrders[index].state.toString().substring(6)}",
                amountTotal: "${cubit.draftOrders[index].amountTotal}",
              );
            },),
        ),
            SizedBox(height: getSize(context)*0.3,)
          ],
        );
        
      },
    );
  }
}
