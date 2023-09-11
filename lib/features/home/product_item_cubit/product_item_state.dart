part of 'product_item_cubit.dart';

@immutable
abstract class ProductItemState {}

class ProductItemInitial extends ProductItemState {}
class IncreaseState extends ProductItemState {}
class DecreaseState extends ProductItemState {}
class AddProductState extends ProductItemState {}
