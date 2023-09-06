import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/core/models/login_response_model.dart';
import 'package:kreez/core/preferences/preferences.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:kreez/features/cart/screens/cart_screen.dart';
import 'package:meta/meta.dart';

import '../../../core/models/all_products_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../profile_feature/profile/screens/profile_screen.dart';
import '../tabs/home_tab.dart';

part 'home_state.dart';
enum WidgetType {
  home,
  cart,
  profile,
}
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial()){
    getAllCategories();
    getAllProducts();

  }
  LoginResponseModel? loginResponseModel;
  ServiceApi api;
  WidgetType selectedWidget = WidgetType.home;
  List<Widget> tabs = [ProfileScreen(),HomeTab(),CartScreen()];
  int sliderCurrentIndex = 0;
  final List<String> sliderImageList = [
    ImageAssets.homeSlider1Image,
    ImageAssets.homeSlider2Image,
    ImageAssets.homeSlider1Image,
  ];
  FloatingActionButtonLocation? floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
  IconData? icon = Icons.home;
  int currentIndex = 1;
  int selectedIndex = 0;
  IconData? leftIcon =Icons.person;
  IconData? rightIcon =  Icons.shopping_cart;

  AllCategoriesModel? allCategoriesModel;
  AllProductsModel? allProductsModel;

  changeDotsIndicator(int index){
   sliderCurrentIndex = index;
   emit(DotsIndicatorChange());
  }


  changeFABLocation(int index){
    if(index==2){
      currentIndex = 2;
      selectedWidget = WidgetType.profile;
      //******************************************************
      if(leftIcon==Icons.home){
        floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
        icon = Icons.home;
        leftIcon = Icons.person;
        // selectedWidget = WidgetType.home;
        emit(FABLocationChanged());

      }
     // ******************************************************
    else{
        floatingActionButtonLocation = FloatingActionButtonLocation.endDocked;
        icon = Icons.person;
        leftIcon = Icons.home;
        rightIcon=Icons.shopping_cart;
      //  selectedWidget = WidgetType.home;
        emit(FABLocationChanged());
      }
    }
    else  if(index==1){
      currentIndex = 1;
      selectedWidget = WidgetType.home;
      floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
      icon = Icons.home;
     // selectedWidget = WidgetType.home;
      emit(FABLocationChanged());

    }
    else    if(index==0){
      currentIndex = 0;
      selectedWidget = WidgetType.cart;
     // selectedWidget = WidgetType.home;
      emit(CartScreenState());
      if(rightIcon==Icons.home){
       // selectedWidget = WidgetType.home;
        floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
        icon = Icons.home;
        rightIcon = Icons.shopping_cart;
        emit(FABLocationChanged());
      }
      else{
        floatingActionButtonLocation = FloatingActionButtonLocation.startDocked;
        icon = Icons.shopping_cart;
        rightIcon = Icons.home;
        leftIcon = Icons.person;
       // selectedWidget = WidgetType.home;
        emit(FABLocationChanged());
      }
    }

  }
  Widget buildSelectedWidget() {
    // emit(HomeScreenState());
    switch (selectedWidget) {
      case WidgetType.home:
        //emit(HomeScreenState());
        return HomeTab();
      case WidgetType.cart:
       // emit(CartScreenState());
        return CartScreen();
      case WidgetType.profile:
       // emit(ProfileScreenState());
        return ProfileScreen();
    }
  }

  getAllCategories() async {
    loginResponseModel = await Preferences.instance.getUserModel();
    final response =await api.getAllCategories();
    response.fold(
            (l) => emit(AllCategoriesFailureState()),
            (r) {
              emit(AllCategoriesSuccessState());
              allCategoriesModel = r;
            });
  }

  getAllProducts() async {
    emit(LoadingAllProductsState());
    final response =await api.getAllProducts();
    response.fold(
            (l) => emit(AllProductsFailureState()),
            (r) {
          emit(AllProductsSuccessState());
          allProductsModel = r;
        });
  }

}
