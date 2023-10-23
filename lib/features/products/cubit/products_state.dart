part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class GettingUserNameState extends ProductsState {}
class ChangingAllTabState extends ProductsState {}
class TabColorChanging extends ProductsState {}
class LoadingAllProductState extends ProductsState {}
class AllProductFailureState extends ProductsState {}
class AllProductSuccessState extends ProductsState {}
