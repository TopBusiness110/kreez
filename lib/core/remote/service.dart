// import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/core/models/register_response_model.dart';
import 'package:kreez/core/preferences/preferences.dart';

import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/all_products_model.dart';
import '../models/auth_model.dart';
import '../models/login_response_model.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final BaseApiConsumer dio;

  ServiceApi(this.dio);

  final odoo = OdooClient('https://store.topbuziness.com');

  Future<String> getSessionId(
      {required String phone, required String password}) async {
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print("phone = $phone");
    print("password = $password");
    final odoResponse =
        await odoo.authenticate('store.topbuziness.com', phone, password);
    final sessionId = odoResponse.id;
    print("session id = $sessionId");
    return sessionId;
  }

  //
  // Future<Either<Failure, LoginResponseModel>> postLoginAsAdmin(
  //     String phoneOrMail,String password) async {
  //   try {
  //     final response = await dio.post(
  //       EndPoints.loginUrl,
  //       body: {
  //         "params":{
  //           'login': phoneOrMail,
  //           "password":password,
  //           "db": "store.topbuziness.com"
  //         },
  //       },
  //     );
  //    String sessionId = await getSessionId(phone: "admin",password: "admin");
  //
  //    await Preferences.instance.setSessionId(sessionId);
  //    await Preferences.instance.setUser(LoginResponseModel.fromJson(response));
  //    await Preferences.instance.isAdmin(true);
  //
  //     return Right(LoginResponseModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  Future<Either<Failure, AuthModel>> postLoginAsAdmin2(
      String phoneOrMail, String password) async {
    try {
      final response = await dio.post(
        EndPoints.loginUrl,
        body: {
          "params": {
            'login': phoneOrMail,
            "password": password,
            "db": "store.topbuziness.com"
          },
        },
      );
      String sessionId = await getSessionId(phone: "admin", password: "admin");

      await Preferences.instance.setSessionId(sessionId);
      await Preferences.instance.setUser2(AuthModel.fromJson(response));
      await Preferences.instance.isAdmin(true);

      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AuthModel>> postLoginAsTrueUser2(
      String phoneOrMail, String password) async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.post(
        EndPoints.loginUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
        body: {
          "params": {
            'login': phoneOrMail,
            "password": password,
            "db": "store.topbuziness.com"
          },
        },
      );

      sessionId = await getSessionId(phone: phoneOrMail, password: password);

      await Preferences.instance.setSessionId(sessionId);
      await Preferences.instance.setUser2(AuthModel.fromJson(response));
      await Preferences.instance.isAdmin(false); //todo-->

      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //***********************************************************************************
  //
  // Future<Either<Failure, LoginResponseModel>> postLoginAsTrueUser(
  //     String phoneOrMail,String password) async {
  //   try {
  //     String? sessionId  =  await Preferences.instance.getSessionId();
  //     final response = await dio.post(
  //       EndPoints.loginUrl,
  //       options: Options(
  //         headers: {
  //           "Cookie":"session_id=$sessionId"
  //         },
  //       ),
  //       body: {
  //         "params":{
  //           'login': phoneOrMail,
  //           "password":password,
  //           "db": "store.topbuziness.com"
  //         },
  //       },
  //     );
  //
  //
  //      sessionId = await getSessionId(phone: phoneOrMail,password: password);
  //
  //     await Preferences.instance.setSessionId(sessionId);
  //     await Preferences.instance.setUser(LoginResponseModel.fromJson(response));
  //    // await Preferences.instance.isAdmin(false); //todo-->
  //
  //     return Right(LoginResponseModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
//*****************************************************************************************
  // Future<Either<Failure, RegisterResponseModel>> postRegister(
  // String fullName,String password, String phone,String? email) async {
  //   try {
  //
  //     String? sessionId  =  await Preferences.instance.getSessionId();
  //     final response = await dio.post(
  //       EndPoints.registerUrl,
  //       options: Options(
  //         headers: {
  //           "Cookie":"session_id=$sessionId"
  //         },
  //       ),
  //       body: {
  //         "params":{
  //        "data":{
  //          "name":fullName,
  //          'login': phone,
  //          "password":password,
  //          "sel_groups_9_44_10":10
  //
  //        }
  //         },
  //       },
  //     ).then((value) async {
  //       sessionId = await getSessionId(phone: phone,password: password);
  //
  //       await Preferences.instance.setSessionId(sessionId!);
  //
  //       await Preferences.instance.isAdmin(false);
  //     }).onError((error, stackTrace) {
  //       print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  //       print("error is $error");
  //     });
  //     await Preferences.instance.setUser(LoginResponseModel.fromJson(response));
  //     // sessionId = await getSessionId(phone: phone,password: password);
  //     //
  //     // await Preferences.instance.setSessionId(sessionId);
  //     // await Preferences.instance.setUser(LoginResponseModel.fromJson(response));
  //     // await Preferences.instance.isAdmin(false);
  //       return Right(RegisterResponseModel.fromJson(response));
  //
  //
  //
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  Future<Either<Failure, AuthModel>> postRegister2(
      String fullName, String password, String phone, String? email) async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.post(
        EndPoints.registerUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
        body: {
          "params": {
            "data": {
              "name": fullName,
              'login': phone,
              "password": password,
              "sel_groups_9_44_10": 10,
            }
          },
        },
      ).onError((error, stackTrace) {
        print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        print("error is $error");
      });
      sessionId = await getSessionId(phone: phone, password: password);
      await Preferences.instance.setSessionId(sessionId);
      await Preferences.instance.isAdmin(false);
      await postLoginAsTrueUser2(phone, password);
      //  await Preferences.instance.setUser2(AuthModel.fromJson(response));
      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllCategoriesModel>> getAllCategories() async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.allCategoriesUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
      );

      return Right(AllCategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AllProductsModel>> getAllProducts() async {
    try {
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        EndPoints.allProductsUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
      );

      return Right(AllProductsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AuthModel>> createSaleOrder() async {
    String? sessionId = await Preferences.instance.getSessionId();
    AuthModel authModel = await Preferences.instance.getUserModel2();
    try {
      final response = await dio.post(
        EndPoints.createSaleOrderUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
        body: {
          "params": {
            "data": {
              "partner_id": authModel.result!.partnerId,
              "pricelist_id": 3,
              "team_id":2,
              "website_id":1
            }
          }
        }
      );
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(response);
      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//
//   Future<Either<Failure, HomeModel>> homeData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.homeUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data?.accessToken!},
//         ),
//       );
//       return Right(HomeModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, CategoriesServicesModel>> servicesData(
//       int catId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.servicesUrl + catId.toString(),
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CategoriesServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//   Future<Either<Failure, UpdatedModel>> editService(
//       int catId,ServiceToUpdate serviceToUpdate) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//
//       List<MultipartFile> images = [];
//       for (int i = 0; i < serviceToUpdate.images!.length; i++) {
//
//         var imageFile = serviceToUpdate.images![i];
//         if (imageFile.path.startsWith('http')) {
//           // This is a remote URL, so we need to download the image and save it locally before uploading it
//           var response = await http.get(Uri.parse(imageFile.path));
//           var bytes = response.bodyBytes;
//           var tempDir = await getTemporaryDirectory();
//           var filePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//           await File(filePath).writeAsBytes(bytes);
//           var image = await MultipartFile.fromFile(filePath);
//           images.add(image);
//         } else {
//           // This is a local file, so we can create a MultipartFile object from it
//           var image = await MultipartFile.fromFile(imageFile.path);
//           images.add(image);
//         }
//       }
//       final response = await dio.post(
//         EndPoints.editServicesUrl + catId.toString(),
//
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           "name":serviceToUpdate.name,
//           "category_id":serviceToUpdate.categoryId,
//           "sub_category_id":serviceToUpdate.subCategoryId,
//           "phones[0]":serviceToUpdate.phones?[0],
//           "phones[1]":serviceToUpdate.phones?[1],
//           "details":serviceToUpdate.details,
//          // "logo":serviceToUpdate.logo,
//           //"logo": await MultipartFile.fromFile(serviceToUpdate.logo!),
//           "logo": !serviceToUpdate.logo!.path.startsWith("http")?await MultipartFile.fromFile(serviceToUpdate.logo!.path):null,
//           "location":serviceToUpdate.location,
//           "images[]":images,
//
//         }
//
//       );
//      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//       print(response);
//       return Right(UpdatedModel.fromJson(response));
//     } on ServerException {
//       print("erroooooor");
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, CategoriesServicesModel>> servicesSearchData(
//       int catId,searchKey) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.servicesUrl + catId.toString(),
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//       return Right(CategoriesServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,CitiesModel>> getCities()async{
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try{
//       final response = await dio.get(
//           EndPoints.citiesUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CitiesModel.fromJson(response));
//     } on ServerException{
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesData() async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//
//       );
//
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   // Future<Either<Failure, NotificationModel>>getNotifications() async {
//   //
//   //   LoginModel loginModel = await Preferences.instance.getUserModel();
//   //   try {
//   //
//   //     final response = await dio.get(
//   //         EndPoints.notificationUrl ,
//   //         options: Options(
//   //           headers: {'Authorization': loginModel.data!.accessToken!},
//   //         ),
//   //
//   //
//   //     );
//   //
//   //     return Right(NotificationModel.fromJson(response));
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
//   //
//
//
//
//   Future<Either<Failure, CategoriesModel>>getCategoriesData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.categoriesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CategoriesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, SettingModel>> getSettingData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.settingUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//
//       return Right(SettingModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,AddToFavouriteResponseModel>> addToFavourite(serviceId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
// try{
//
//   final response = await dio.post(
//       EndPoints.addToFavouriteUrl,
//       options: Options(
//         headers: {"Authorization":loginModel.data!.accessToken},
//       ),
//       body: {"service_id":serviceId}
//   );
//   return Right(AddToFavouriteResponseModel.fromJson(response));
// } on ServerException{
//   return Left(ServerFailure());
// }
//   }

// Future<Either<Failure, SearchModel>> search(searchKey) async {
//   LoginModel loginModel = await Preferences.instance.getUserModel();
//
//   try {
//     final response = await dio.get(
//       EndPoints.searchUrl+searchKey,
//       options: Options(
//         headers: {'Authorization': loginModel.data!.accessToken!},
//       ),
//     );
//     return Right(SearchModel.fromJson(response));
//   } on ServerException {
//     return Left(ServerFailure());
//   }
// }
}
