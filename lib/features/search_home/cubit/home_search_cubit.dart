import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/products_by_category_id.dart';
import '../../../core/remote/service.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  HomeSearchCubit(this.api) : super(HomeSearchInitial());
  ServiceApi api;

  ProductsByCategoryIdModel? productsByCategoryIdModel;

  searchForProducts(String keyWord) async {
    emit(LoadingSearchProductState());
    final response = await api.searchProduct(keyWord);
    response.fold((l) {

      emit(FailureSearchProductState());
    },
            (r) {
          emit(SuccessSearchProductState());
          productsByCategoryIdModel = r;

        });
  }


}
