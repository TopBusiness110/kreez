part of 'cart_list_item_cubit.dart';

@immutable
abstract class CartListItemState {}

class CartListItemInitial extends CartListItemState {}
class IncreasingQuantityState extends CartListItemState {}
class DecreasingQuantityState extends CartListItemState {}
class RemovingItemState extends CartListItemState {}
