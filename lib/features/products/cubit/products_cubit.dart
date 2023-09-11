import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

import '../../../core/models/products_by_category_id.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.api) : super(ProductsInitial());
  ServiceApi api;

  ProductsByCategoryIdModel? productsByCategoryIdModel;

  getProductsByCategoryId(int categoryId) async {
    emit(LoadingProductState());
    final response = await api.getProductsByCategoryId(categoryId);
    response.fold((l) {

      emit(FailureProductState());
    },
            (r) {
      emit(SuccessProductState());
      productsByCategoryIdModel = r;
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      print(productsByCategoryIdModel);
            });
  }
}
