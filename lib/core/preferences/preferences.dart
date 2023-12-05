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
  Future<String?> getSessionId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? sessionId = preferences.getString('sessionId');
    return sessionId;
  }
  //*********************************************************

  Future<void> setSessionIdTruUser(String sessionId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('sessionIdTrueUser',sessionId );
    print("sessionIdTrueUser = $sessionId");
  }
  Future<String?> getSessionIdTrueUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? sessionId = preferences.getString('sessionIdTrueUser');
    return sessionId;
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


  Future<void> setCart(Map<int, ProductModel> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //// Convert the cart map to a list of JSON-encodable objects
    List<Map<String,dynamic>> cartList = cart.entries.map(
            (entry) {
              int productId = entry.key;
              ProductModel productModel = entry.value;
              return {
                "productId":productId,
                "product":productModel.toJson()
              };
            } ).toList();
          //// Convert the list to JSON
         String cartJson = jsonEncode(cartList);
         await prefs.setString("cart", cartJson);
  }

 Future<Map<int,ProductModel>?> getCart()async{
    // Retrieve the saved cart JSON string from shared preferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? cartJson = preferences.getString("cart");
    if(cartJson!=null){
      // Parse the JSON string back to a list of objects
      List<dynamic> cartList = jsonDecode(cartJson);
      // Convert the list back to a cart map
      Map<int,ProductModel> cart = {};
      for(var item in cartList){
        int productId = item["productId"];
        ProductModel productModel = ProductModel.fromJson(item["product"]);
        cart[productId] = productModel;
      }
      return cart;
    }
    return {};
  }


  Future clearCart()async{
try{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove("cart");
}catch(e){
  return null;
}

  }
   // Future< Map<dynamic,ProductModel>> getCart ()async{
   //   SharedPreferences preferences = await SharedPreferences.getInstance();
   //   String? cartJson = preferences.getString("cart");
   //
   //   if(cartJson!=null){
   //     Map<String, dynamic> cartData = jsonDecode(cartJson);
   //     Map<String, ProductModel> cart = {};
   //    cartData.forEach((key, value) {
   //      cart[key] = ProductModel.fromJson(value);
   //    });
   //    return cart;
   //   }
   //   else return {};
   // }

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
