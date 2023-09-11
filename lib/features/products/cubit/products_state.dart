part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class LoadingProductState extends ProductsState {}
class SuccessProductState extends ProductsState {}
class FailureProductState extends ProductsState {}
