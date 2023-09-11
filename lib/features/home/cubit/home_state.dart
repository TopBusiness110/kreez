part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class FABLocationChanged extends HomeState {}
class ProfileScreenState extends HomeState {}
class HomeScreenState extends HomeState {}
class CartScreenState extends HomeState {}
class DotsIndicatorChange extends HomeState {}
class AllCategoriesFailureState extends HomeState {}
class AllCategoriesSuccessState extends HomeState {}
class AllProductsFailureState extends HomeState {}
class AllProductsSuccessState extends HomeState {}
class LoadingAllProductsState extends HomeState {}
class LoadingAllCategoriesState extends HomeState {}
class IncreasingDecreasingQuchantity extends HomeState {
  final ProductModel productModel;

  IncreasingDecreasingQuchantity(this.productModel);
}

class AddProductFromHomeState extends HomeState {}
