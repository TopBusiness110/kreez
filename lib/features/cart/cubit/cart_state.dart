part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class RemovingItemState extends CartState {}
class IncreasingQuantityState extends CartState {}
class DecreasingQuantityState extends CartState {}
class LoadingCreateOrderState extends CartState {}
class FailureCreateOrderState extends CartState {}
class SuccessCreateOrderState extends CartState {}
