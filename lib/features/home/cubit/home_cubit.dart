import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FloatingActionButtonLocation? floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
  IconData? icon = Icons.home;
  IconData? leftIcon =Icons.person;
  IconData? rightIcon =  Icons.shopping_cart;

  changeFABLocation(int index){
    if(index==2){
      //******************************************************
      if(leftIcon==Icons.home){
        floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
        icon = Icons.home;
        leftIcon = Icons.person;
        emit(FABLocationChanged());
      }
     // ******************************************************
    else{
        floatingActionButtonLocation = FloatingActionButtonLocation.endDocked;
        icon = Icons.person;
        leftIcon = Icons.home;
        rightIcon=Icons.shopping_cart;
        emit(FABLocationChanged());
      }
    }
    else  if(index==1){
      floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;
      icon = Icons.home;
      emit(FABLocationChanged());
    }
    else    if(index==0){
      if(rightIcon==Icons.home){
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
        emit(FABLocationChanged());
      }
    }

  }
}
