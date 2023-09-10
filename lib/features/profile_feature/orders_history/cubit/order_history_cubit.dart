import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/models/get_all_sale_orders.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this.api) : super(OrderHistoryInitial()){
    getAllSaleOrder();
  }

  TabController? tabController ;
  ServiceApi api ;
  List<SaleOrderResult> draftOrders =[];
  List<SaleOrderResult> otherOrders =[];
  GetAllSaleOrderModel? getAllSaleOrderModel;

  getAllSaleOrder()async{
    //loadingDialog();
    emit(LoadingAllOrdersState());
    final response = await api.getAllSaleOrderForPartner();
    response.fold((l){
    //  Navigator.pop(context);
      emit(FailureGettingAllOrdersState());

    }, (r) {
     // Navigator.pop(context);
      emit(SuccessGettingAllOrdersState());
      getAllSaleOrderModel = r;
      filterData(getAllSaleOrderModel);

    }
    );
  }

  void filterData(GetAllSaleOrderModel? getAllSaleOrderModel){
    List<SaleOrderResult>? result = getAllSaleOrderModel?.result;

    for(int i=0;i<result!.length ; i++){
      if(result[i].state.toString()=="State.DRAFT"){
        draftOrders.add(result[i]);
      }
      else{
        otherOrders.add(result[i]);
      }
    }
    // getAllSaleOrderModel?.result?.forEach((result) {
    //   if(result.state.toString()=="draft"){
    //     draftOrders.add(result);
    //   }
    //   else{
    //     otherOrders.add(result);
    //   }
    // });
    print("________________________________________________________________");
    print(draftOrders);
  }


}
