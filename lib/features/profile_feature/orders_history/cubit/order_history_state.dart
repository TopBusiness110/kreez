part of 'order_history_cubit.dart';

@immutable
abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}
class LoadingAllOrdersState extends OrderHistoryState {}
class FailureGettingAllOrdersState extends OrderHistoryState {}
class SuccessGettingAllOrdersState extends OrderHistoryState {}
