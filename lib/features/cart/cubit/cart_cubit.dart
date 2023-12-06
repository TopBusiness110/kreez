
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kreez/core/models/auth_model.dart';
import 'package:kreez/core/preferences/preferences.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';
import '../../../core/utils/dialogs.dart';
import '../../home/product_item_cubit/product_item_cubit.dart';
import '../../product_details/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.api) : super(CartInitial()) {
    getUserName();
    getCart();
  }

  ServiceApi api;
  AuthModel? authModel;

  // Map<int,ProductModel> cart = {};
  AuthModel? createSaleOrderResponse;

  String? name;

  getUserName() async {
    final AuthModel user = await Preferences.instance.getUserModel2();
    name = user.result.name;
    emit(GettingUserNameState());
  }

  bool cartIsEmpty = true;

  createSaleOrder() async {
     loadingDialog();
    // emit(LoadingCreateOrderState());
    final response = await api.createSaleOrder();

    response.fold((l) {}, (r) {
      if (r.result != null) {
        createSaleOrderResponse = r;
      } else {}
    });
  }

  createSaleOrderLines(BuildContext context,
      {required int saleOrderId,
      required int productId,
      required String productName,
      required double productQuantity}) async {
  //  loadingDialog();
    emit(LoadingCreateOrderState());
    final response = await api.createSaleOrderLines(
        orderId: saleOrderId,
        productId: productId,
        productName: productName,
        productQuantity: productQuantity);
    response.fold((l) {
      Navigator.pop(context);
      emit(FailureCreateOrderState());
    }, (r) {
      if (r.result != null) {
        authModel = r;
        //todo=>
        // cart1.clear();
        // Navigator.pop(context);
        Preferences.instance.clearCart().then((e) {
          cart1.clear();
          Navigator.pop(context);
          emit(SuccessCreateOrderState());
        });
        emit(SuccessCreateOrderState());
      } else {
        Navigator.pop(context);
        emit(FailureCreateOrderState());
      }
    });
  }

  increaseQuantity(ProductModel productModel,BuildContext context) async {
    double productQuantity = productModel.quantity!;
    productQuantity++;
    productModel.quantity = productQuantity;
    print("###############################");
    //todo => add this new quantity to the cart
    await context.read<ProductItemCubit>().addToCart(productModel, context);
    print(productModel.quantity);
    emit(IncreasingQuantityState());
  }

  decreaseQuantity(ProductModel productModel, BuildContext context) async {
    double productQuantity = productModel.quantity!;
    if (productQuantity == 1) {
      removeItem(productModel.id);
      // removeItem(productModel,context);
    } else {
      productQuantity--;
      productModel.quantity = productQuantity;
      //todo => add this new quantity to the cart
      await context.read<ProductItemCubit>().addToCart(productModel, context);
      emit(DecreasingQuantityState());
    }
  }

  // removeItem(int? id){
  //   cart.remove(id);
  //   emit(RemovingItemState());
  // }
  removeItem(int? id) async {
    cart1?.remove(id);
    await Preferences.instance.setCart(cart1!);
    emit(RemovingItemState());
  }

  Map<int, ProductModel> cart1 = {};

  getCart() async {
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    emit(LoadingCartState());
    cart1 = await Preferences.instance.getCart() ?? {};
    print(cart1);
    if (cart1.isEmpty) {
      emit(EmptyCartState());
    } else {
      emit(CartSuccessState());
    }
  }
}
