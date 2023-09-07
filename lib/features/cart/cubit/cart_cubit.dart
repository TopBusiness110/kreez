import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../product_details/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Map<int,ProductModel> cart = {};


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
