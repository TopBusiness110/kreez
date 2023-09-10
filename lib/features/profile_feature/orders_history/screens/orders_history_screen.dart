import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/profile_feature/orders_history/cubit/order_history_cubit.dart';
import 'package:kreez/features/profile_feature/orders_history/tabs/canceled_orders_tab.dart';
import 'package:kreez/features/profile_feature/orders_history/tabs/completed_orders_tab.dart';
import 'package:kreez/features/profile_feature/orders_history/tabs/next_orders_tab.dart';

import '../../../../core/utils/app_colors.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen>with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    context.read<OrderHistoryCubit>().tabController = TabController(length: 2, vsync: this);
  }

  // @override
  // void dispose() {
  //   context.read<OrderHistoryCubit>().tabController?.dispose();
  //   super.dispose();
  //
  // }




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? lang = EasyLocalization.of(context)?.locale.countryCode;
    return BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
  listener: (context, state) {
    if(state is FailureGettingAllOrdersState||state is SuccessGettingAllOrdersState){
     // Navigator.pop(context);
    }
  },
  builder: (context, state) {
    OrderHistoryCubit cubit = context.read<OrderHistoryCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: height*0.19,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Column(

                children: [
                  SizedBox(height: height*0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Transform.rotate(
                            angle: lang == "en" ? 0 : (3.14),
                            child:  Icon(
                              Icons.arrow_back_outlined,
                              size: 30,
                              color: AppColors.white,
                            ),
                          )),
                    ],
                  ),
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("order_history".tr(),style: Theme.of(context).textTheme.bodyMedium),
                  ),),
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor:AppColors.primary ,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.black,
              controller:cubit.tabController,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Text("current_orders".tr(),),
                  Text("last_orders".tr(),),
                //  Text("canceled_orders".tr(),),
            ]),
            SizedBox(
              height: height*0.8,
                child: TabBarView(
                 controller: cubit.tabController,
                  children: const [
                 CompletedOrdersTab(),
                 NextOrdersTab(),
               //  CanceledOrdersTab()
              ],
            ))
          ],
        ),
      ),
    );
  },
);
  }
}
