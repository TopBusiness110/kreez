

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kreez/core/models/auth_model.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/dialogs.dart';
import '../../product_details/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.api) : super(CartInitial());
  ServiceApi api;
AuthModel? authModel;
  Map<int,ProductModel> cart = {};

  createSaleOrder(BuildContext context)async{
    loadingDialog();
    emit(LoadingCreateOrderState());
    final response =await api.createSaleOrder();

    response.fold(
            (l) {
      Navigator.pop(context);
      emit(FailureCreateOrderState());
      },
            (r) {
              Navigator.pop(context);
            if(r.result!=null){
              emit(SuccessCreateOrderState());
              authModel = r;
            }
            else{
              emit(FailureCreateOrderState());
            }

            }
    );

  }



  removeItem(int? id){
    cart.remove(id);
    emit(RemovingItemState());
  }

  increaseQuantity(ProductModel productModel){
    double productQuantity = productModel.quantity!;
    productQuantity++;
    productModel.quantity = productQuantity;

    print("###############################");
    print(productModel.quantity);
    emit(IncreasingQuantityState());
  }

  decreaseQuantity(ProductModel productModel){
    double productQuantity = productModel.quantity!;
    if(productQuantity==0){

    }
   else{
      productQuantity--;
      productModel.quantity = productQuantity;

      print("###############################");
      print(productModel.quantity);
      emit(DecreasingQuantityState());
    }
  }
}
