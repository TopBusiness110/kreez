part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class FABLocationChanged extends HomeState {}
class ProfileScreenState extends HomeState {}
class HomeScreenState extends HomeState {}
class CartScreenState extends HomeState {}
class DotsIndicatorChange extends HomeState {}
