import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kreez/features/cart/screens/cart_screen.dart';
import 'package:kreez/features/home/screens/home_screen.dart';
import 'package:meta/meta.dart';

import '../../profile/screens/profile_screen.dart';

part 'home_state.dart';
enum WidgetType {
  home,
  cart,
  profile,
}
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  WidgetType selectedWidget = WidgetType.home;
  List<Widget> tabs = [ProfileScreen(),HomeTab(),CartScreen()];
  FloatingActionButtonLocation? floatingActionButtonLocation = FloatingActionButtonLocation.centerFloat;
  IconData? icon = Icons.home;
  int currentIndex = 1;
  int selectedIndex = 0;
  IconData? leftIcon =Icons.person;
  IconData? rightIcon =  Icons.shopping_cart;

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

}
