import 'dart:convert';


import 'package:kreez/core/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/product_details/models/product_model.dart';
import '../models/login_response_model.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<void> setSaleOrder (int result) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("orderNumber", result);
    print(await getSaleOrder());

  }
  Future<int?> getSaleOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   int? orderNumber =  preferences.getInt("orderNumber");
   return orderNumber;

  }

  Future<void> setPartnerId(int partner_id) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('partnerId',partner_id );
    print("partner_id = $partner_id");
  }
  Future<void> setSessionId(String sessionId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('sessionId',sessionId );
    print("sessionId = $sessionId");
  }
  Future<void> isAdmin(bool is_admin) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isAdmin',is_admin );
    print("isAdmin = $is_admin");
  }
  Future<bool?> getIsAdmin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isAdmin = preferences.getBool('isAdmin');
    return isAdmin;
  }
  Future<void> setOnBoardingFirstTime(bool firstTime) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('firstTime',firstTime );
    print("firstTime = $firstTime");
  }
  Future<bool?> getOnBoardingFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? firstTime = preferences.getBool('firstTime');
    return firstTime;
  }
  Future<String?> getSessionId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? sessionId = preferences.getString('sessionId');
    return sessionId;
  }
  Future<int?> getPartnerId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? partnerId = preferences.getInt('partnerId');
    return partnerId;
  }

  // Future<void> setFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('onBoarding', 'Done');
  // }

  // Future<String?> getFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonData = prefs.getString('onBoarding');
  //   return jsonData;
  // }
  //
  // Future<void> setUser(LoginResponseModel loginModel) async {
  //
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(
  //       'user', jsonEncode(LoginResponseModel.fromJson(loginModel.toJson())));
  //   print(await getUserModel());
  // }


  Future<void> setUser2(AuthModel authModel) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'user2', jsonEncode(AuthModel.fromJson(authModel.toJson())));
   // print(await getUserModel2());
  }
  //
  // Future<void> setCart( Map<int,ProductModel> cart) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   Map<int, dynamic> cartData = {};
  //   cart.forEach((key, value) {
  //     cartData[key] = value.toJson();
  //   });
  //   preferences.setString("cart", jsonEncode(cartData));
  //   print(":) :) :) :) :) : ) ");
  //   print("cart  = ${getCart()}");
  // }

  Future<void> setCart1(List<Map<int, ProductModel>> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<int, dynamic> cartData = {};
    // cart.forEach((key, value) {
    //   cartData[key] = value.toJson();
    // });
    cart.forEach((element) {
      element.forEach((key, value) {
        cartData[key] = value.toJson();
      });
    });
    print("____________________________________");
    print(cartData);
    String cartJson = jsonEncode(cartData);
    print("____________________________________");
    print("cart json = $cartJson");
    await prefs.setString('cart', cartJson);
  }
   Future< Map<dynamic,ProductModel>> getCart ()async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     String? cartJson = preferences.getString("cart");

     if(cartJson!=null){
       Map<String, dynamic> cartData = jsonDecode(cartJson);
       Map<String, ProductModel> cart = {};
      cartData.forEach((key, value) {
        cart[key] = ProductModel.fromJson(value);
      });
      return cart;
     }
     else return {};
   }

 Future<void> clearShared()async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.clear();
 }
  // Future<LoginResponseModel> getUserModel() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? jsonData = preferences.getString('user');
  //   LoginResponseModel userModel;
  //   if (jsonData != null) {
  //     userModel = LoginResponseModel.fromJson(jsonDecode(jsonData));
  //   } else {
  //     userModel = LoginResponseModel();
  //   }
  //   return userModel;
  // }

  Future<AuthModel> getUserModel2() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user2');
    AuthModel authModel;
    if (jsonData != null) {
      authModel = AuthModel.fromJson(jsonDecode(jsonData));

    } else {
      authModel = AuthModel();
    }
    return authModel;
  }

}
