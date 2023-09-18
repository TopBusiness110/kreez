// import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kreez/core/models/all_categories_model.dart';
import 'package:kreez/core/models/products_by_category_id.dart';
import 'package:kreez/core/models/register_response_model.dart';
import 'package:kreez/core/preferences/preferences.dart';

import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/all_products_model.dart';
import '../models/auth_model.dart';
import '../models/get_all_sale_orders.dart';
import '../models/login_response_model.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  final BaseApiConsumer dio;

  ServiceApi(this.dio);

  final odoo = OdooClient('https://store.topbuziness.com');

  Future<String> getSessionId(
      {required String phone, required String password}) async {
    final odoResponse =
        await odoo.authenticate('store.topbuziness.com', phone, password);
    final sessionId = odoResponse.id;
    return sessionId;
  }


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
      Either either =  await postLoginAsTrueUser2(phone, password);
      AuthModel? authModel;
      either.fold((l) => null, (r) {
        authModel = r;
      });

        await Preferences.instance.setUser2(authModel!);
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
              "pricelist_id": 1,
              "team_id":2,
              "website_id":1
            }
          }
        }
      ).onError((error, stackTrace) {
        print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        print(error.toString());
      });
      Preferences.instance.setSaleOrder(AuthModel.fromJson(response).result);
      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AuthModel>> createSaleOrderLines(
      {required orderId ,required int productId,required String productName,required double productQuantity}) async {

    String? sessionId = await Preferences.instance.getSessionId();

    try {
      final response = await dio.post(
          EndPoints.createSaleOrderLineUrl,
          options: Options(
            headers: {"Cookie": "session_id=$sessionId"},
          ),
          body: {
            "params": {
              "data": {
                "order_id":orderId,
                "product_id":productId,
                "name": productName,
                "product_uom_qty": productQuantity
              }
            }
          }
      );


      return Right(AuthModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,GetAllSaleOrderModel>>  getAllSaleOrderForPartner() async {
  try{
    String? sessionId = await Preferences.instance.getSessionId();
    AuthModel authModel = await Preferences.instance.getUserModel2();
    final partnerId = authModel.result.partnerId;
  final response = await  dio.get(
        EndPoints.getAllSaleOrderForPartnerUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
        ),
        queryParameters: {
          "query":"{id,display_name,state,write_date,amount_total}",
          "filter":[["partner_id", "=",partnerId]]
        }
    );
    return Right(GetAllSaleOrderModel.fromJson(response));
  } on ServerException{
    return Left(ServerFailure());
  }

    }

  Future<Either<Failure,ProductsByCategoryIdModel>>  getProductsByCategoryId(int categoryId)async{

    try{
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        'https://store.topbuziness.com/api/product.product/?query={id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,description_sale,image_1920}&filter=[["public_categ_ids", "=", [$categoryId]]]',
       // EndPoints.getProductsByCategoryIdUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
         ),
        // queryParameters: {
        //   "query" : "{id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,description_sale,image_1920}",
        //   "filter" : [["public_categ_ids=[$categoryId]"]]
        // }
      );
      return Right(ProductsByCategoryIdModel.fromJson(response));

    }on ServerException{
      return Left(ServerFailure());
    }
  }




  Future<Either<Failure,ProductsByCategoryIdModel>>  searchProduct(String keyWord)async{

    try{
      String? sessionId = await Preferences.instance.getSessionId();
      final response = await dio.get(
        'https://store.topbuziness.com/api/product.product/?query={id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,description_sale,image_1920}&filter=[["name", "=", "$keyWord"]]',
        //EndPoints.searchProductUrl,
        options: Options(
          headers: {"Cookie": "session_id=$sessionId"},
         ),
        // queryParameters: {
        //   "query" : "{id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,description_sale,image_1920}",
        //   "filter" : [["name", "=", "$keyWord"]]}
      );
      return Right(ProductsByCategoryIdModel.fromJson(response));

    }on ServerException{
      return Left(ServerFailure());
    }
  }






}
