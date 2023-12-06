

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/preferences/preferences.dart';
import 'package:kreez/features/cart/cubit/cart_cubit.dart';
import 'package:meta/meta.dart';

import '../../../config/routes/app_routes.dart';
import '../models/product_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  double quantity = 0;

  add(){
    quantity+=1;

    emit(AddQuantityState());
  }

  remove(){
    if(quantity==0){

    }
 else{
      quantity-=1;
      emit(RemoveQuantityState());
    }
  }
//todo=>
  // addToCart(ProductModel productModel, BuildContext context){
  //   if(productModel.quantity>0){
  //     context.read<CartCubit>().cart[productModel.id!] = productModel;
  //     emit(AddProductState());
  //     print(context.read<CartCubit>().cart);
  //     Navigator.pushNamed(context, Routes.homeRoute);
  //     quantity = 0;
  //   }
  //   else{
  //     emit(ZeroQuantity());
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quantity = 0 ")));
  //   }
  //
  // }

  addToCart(ProductModel productModel, BuildContext context){
    if(productModel.quantity!>0){
      context.read<CartCubit>().cart1?[productModel.id!] = productModel;
      emit(AddProductState());
      print(context.read<CartCubit>().cart1);
      Navigator.pushNamed(context, Routes.homeRoute);
      quantity = 0;
    }
    else{
      emit(ZeroQuantity());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quantity = 0 ")));
    }

  }

}
