import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/models/auth_model.dart';
import 'package:kreez/core/preferences/preferences.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

import '../../../core/models/all_categories_model.dart' as allCategories;
import '../../../core/models/all_products_model.dart';
import '../../../core/models/products_by_category_id.dart';
import '../../../core/utils/app_colors.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.api) : super(ProductsInitial()){
    getUserName();
    getAllProducts();
  }
  TabController? tabController ;
  Color tabColor = AppColors.black;
  ServiceApi api;
  String? name;
  bool all = true;
  AllProductsModel? allProductsModel;

  getAllProducts() async {
    all=true;
    allProductsModel=null;

    emit(LoadingAllProductState());
    final response =await api.getAllProducts();
    response.fold(
            (l) => emit(AllProductFailureState()),
            (r) {
          allProductsModel = r;

          emit(AllProductSuccessState());

        });
  }

  changeAllTab(bool isAll){
    all = isAll ;
    emit(ChangingAllTabState());
  }

  changeTabColor(allCategories.Result result){
    result.isSelected = ! result.isSelected ;

    emit(TabColorChanging());
  }

  ProductsByCategoryIdModel? productsByCategoryIdModel;

  getProductsByCategoryId(int categoryId) async {
    print("object");
    print(categoryId);
    all=false;
    productsByCategoryIdModel=null;
    emit(LoadingAllProductState());
    final response = await api.getProductsByCategoryId(categoryId);
    response.fold((l) {

      emit(AllProductFailureState());
    },
            (r) {
      emit(AllProductSuccessState());
      productsByCategoryIdModel = r;

            });
  }

  getUserName()async{
    final AuthModel authModel = await Preferences.instance.getUserModel2();
    name = authModel.result.name;
    emit(GettingUserNameState());
  }
}
