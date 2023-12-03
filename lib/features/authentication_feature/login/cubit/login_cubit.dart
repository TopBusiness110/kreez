import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/models/auth_model.dart';
import 'package:kreez/core/models/login_error_model.dart';
import 'package:kreez/core/models/login_response_model.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/check_user_model.dart';
import '../../../../core/utils/dialogs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial()){
    api.postLoginAsAdmin2("api", "api");//step 1 fake login
  }



  TextEditingController phoneOrMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ServiceApi api;
 // late LoginResponseModel loginResponseModel ;
 // late LoginErrorModel loginErrorModel ;
 late AuthModel authModel;



  // loginAsAdmin(BuildContext context) async {
  //   loadingDialog();
  //   final response = await api.postLoginAsAdmin2(phoneOrMailController.text, passwordController.text);
  //   response.fold(
  //           (l) {
  //         Navigator.pop(context);
  //         emit(LoginFailureState());
  //
  //       },
  //           (r) {
  //         Navigator.pop(context);
  //         if(r.result==null){
  //           emit(LoginFailureState());
  //           authModel = r ;
  //           emit(LoginFailureState());
  //         }
  //         else{
  //           emit(LoginSuccessState());
  //           authModel = r;
  //
  //         }
  //
  //       });
  // }

  //************************************************************************************
  // loginAsAdmin(BuildContext context) async {
  //   loadingDialog();
  //   final response = await api.postLoginAsAdmin(phoneOrMailController.text, passwordController.text);
  //   response.fold(
  //           (l) {
  //           Navigator.pop(context);
  //           emit(LoginFailureState());
  //
  //           },
  //           (r) {
  //             Navigator.pop(context);
  //             if(r.result==null){
  //               emit(LoginFailureState());
  //               loginErrorModel = r as LoginErrorModel;
  //               emit(LoginFailureState());
  //             }
  //             else{
  //               emit(LoginSuccessState());
  //               loginResponseModel = r;
  //
  //             }
  //
  //           });
  // }
//**************************************************************************************
  // loginAsTrueUser(BuildContext context) async {
  //   loadingDialog();
  //   final response = await api.postLoginAsTrueUser(phoneOrMailController.text, passwordController.text);
  //   response.fold(
  //           (l) {
  //         Navigator.pop(context);
  //         emit(LoginFailureState());
  //
  //       },
  //           (r) {
  //         Navigator.pop(context);
  //         if(r.result==null){
  //           emit(LoginFailureState());
  //           // loginErrorModel = r as LoginErrorModel;
  //           // emit(LoginFailureState());
  //         }
  //         else{
  //           emit(LoginSuccessState());
  //           loginResponseModel = r;
  //
  //         }
  //
  //       });
  // }

  CheckUserModel? checkUserModel;
  loginAsTrueUser2(BuildContext context) async {
    loadingDialog();
    // todo=>check phone

    final user = await api.checkUser(phoneOrMailController.text);
    user.fold((l) {

    }, (r) async {
      checkUserModel = r;
      print("##################################");
      print(checkUserModel);
      if(checkUserModel?.result?.length==0){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("this phone number does not exist register first")));
      }
      else{
        final response = await api.postLoginAsTrueUser2(phoneOrMailController.text, passwordController.text);
        response.fold(
                (l) {
              Navigator.pop(context);
              emit(LoginFailureState());

            },
                (r) {
              Navigator.pop(context);
              if(r.result==null){
                emit(LoginFailureState());
                // loginErrorModel = r as LoginErrorModel;
                // emit(LoginFailureState());
              }
              else{
                emit(LoginSuccessState());
                authModel = r;

              }

            });

      }
    });

    // final response = await api.postLoginAsTrueUser2(phoneOrMailController.text, passwordController.text);
    // response.fold(
    //         (l) {
    //       Navigator.pop(context);
    //       emit(LoginFailureState());
    //
    //     },
    //         (r) {
    //       Navigator.pop(context);
    //       if(r.result==null){
    //         emit(LoginFailureState());
    //         // loginErrorModel = r as LoginErrorModel;
    //         // emit(LoginFailureState());
    //       }
    //       else{
    //         emit(LoginSuccessState());
    //         authModel = r;
    //
    //       }
    //
    //     });
  }
}
