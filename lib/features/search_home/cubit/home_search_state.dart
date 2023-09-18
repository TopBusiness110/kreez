part of 'home_search_cubit.dart';

@immutable
abstract class HomeSearchState {}

class HomeSearchInitial extends HomeSearchState {}
class LoadingSearchProductState extends HomeSearchState {}
class FailureSearchProductState extends HomeSearchState {}
class SuccessSearchProductState extends HomeSearchState {}
