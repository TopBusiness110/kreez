import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kreez/features/authentication_feature/login/cubit/login_cubit.dart';
import 'package:kreez/features/authentication_feature/register/cubit/register_cubit.dart';
import 'package:kreez/features/home/cubit/home_cubit.dart';


import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/remote/service.dart';
import 'features/cart/cubit/cart_cubit.dart';
import 'features/cart/item_cubit/cart_list_item_cubit.dart';
import 'features/home/product_item_cubit/product_item_cubit.dart';
import 'features/product_details/cubit/product_details_cubit.dart';
import 'features/products/cubit/products_cubit.dart';
import 'features/profile_feature/orders_history/cubit/order_history_cubit.dart';

// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  //
  serviceLocator.registerFactory(
    () => HomeCubit(
         serviceLocator(),
        ),);

  serviceLocator.registerFactory(
    () => OrderHistoryCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => LoginCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => RegisterCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProductsCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CartCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProductDetailsCubit(
     // serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProductItemCubit(
     // serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CartListItemCubit(
     // serviceLocator(),
    ),
  );


  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}

class SplashCubit {
}
