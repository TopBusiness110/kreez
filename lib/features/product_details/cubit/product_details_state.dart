part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class AddQuantityState extends ProductDetailsState {}
class RemoveQuantityState extends ProductDetailsState {}
class AddProductState extends ProductDetailsState {}
class ZeroQuantity extends ProductDetailsState {}
