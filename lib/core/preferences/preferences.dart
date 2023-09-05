import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response_model.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<void> setSessionId(String sessionId) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('sessionId',sessionId );
    print("sessionId = $sessionId");
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

  // Future<void> setFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('onBoarding', 'Done');
  // }

  // Future<String?> getFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonData = prefs.getString('onBoarding');
  //   return jsonData;
  // }

  Future<void> setUser(LoginResponseModel loginModel) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'user', jsonEncode(LoginResponseModel.fromJson(loginModel.toJson())));
    print(await getUserModel());
  }
 Future<void> clearShared()async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.clear();
 }
  Future<LoginResponseModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    LoginResponseModel userModel;
    if (jsonData != null) {
      userModel = LoginResponseModel.fromJson(jsonDecode(jsonData));
    } else {
      userModel = LoginResponseModel();
    }
    return userModel;
  }

}
