import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';
import 'package:meta/meta.dart';

import '../../product_details/models/product_model.dart';

part 'cart_list_item_state.dart';

class CartListItemCubit extends Cubit<CartListItemState> {
  CartListItemCubit() : super(CartListItemInitial());

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

  //
  // removeItem(int? id,BuildContext context){
  //   context.read<CartCubit>().cart.remove(id);
  //   emit(RemovingItemState());
  // }
}
