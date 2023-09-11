import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/routes/app_routes.dart';
import '../../cart/cubit/cart_cubit.dart';
import '../../product_details/models/product_model.dart';

part 'product_item_state.dart';

class ProductItemCubit extends Cubit<ProductItemState> {
  ProductItemCubit() : super(ProductItemInitial());

  decrease(ProductModel productModel,BuildContext context){
    double quantity = productModel.quantity;
    if(quantity==0){

    }
    else{
      productModel.quantity=productModel.quantity-1;
     emit(DecreaseState());

    }
    addToCart(productModel, context);
  }

  increase(ProductModel productModel,BuildContext context){
    double quantity = productModel.quantity;
    quantity++;
    productModel.quantity =quantity ;
   emit(IncreaseState());
   addToCart(productModel, context);



  }

  addToCart(ProductModel productModel, BuildContext context){
    context.read<CartCubit>().cart[productModel.id!] = productModel;
    emit(AddProductState());



  }
}
