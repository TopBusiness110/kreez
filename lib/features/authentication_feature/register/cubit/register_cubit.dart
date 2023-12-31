import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kreez/core/models/auth_model.dart';
import 'package:kreez/core/models/register_response_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/check_user_model.dart';
import '../../../../core/models/login_error_model.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/dialogs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial()){

  }
  final ServiceApi api;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late CountryCode selectedCountryCode;

 late RegisterResponseModel registerResponseModel;
 late AuthModel authModel;
  // late LoginErrorModel loginErrorModel ;
  //
  // register(BuildContext context) async {
  //   loadingDialog();
  //   final response = await api.postRegister(fullNameController.text, passwordController.text,phoneController.text,emailController.text);
  //   response.fold(
  //           (l) {
  //         Navigator.pop(context);
  //         emit(RegisterFailureState());
  //
  //       },
  //           (r) {
  //         Navigator.pop(context);
  //         if(r.result==null){
  //           emit(RegisterFailureState());
  //         //  loginErrorModel = r as LoginErrorModel;
  //
  //         }
  //         else{
  //
  //           emit(RegisterSuccessState());
  //           Navigator.pop(context);
  //           registerResponseModel = r;
  //
  //         }
  //
  //       });
  // }

  CheckUserModel? checkUserModel;
  register2(BuildContext context) async {
    loadingDialog();
     // todo=>check phone

    final user = await api.checkUser(phoneController.text);
    user.fold((l) {

    }, (r) async {
     checkUserModel = r;
     print("##################################");
     print(checkUserModel);
     if(checkUserModel?.result?.length==0){
       final response = await api.postRegister2(fullNameController.text, passwordController.text,phoneController.text,emailController.text);
       response.fold(
               (l) {
             Navigator.pop(context);
             emit(RegisterFailureState());

           },
               (r) {
             Navigator.pop(context);
             if(r.result==null){
               emit(RegisterFailureState());
               //todo -->handle emits because we have now only one mode auth model
               //todo--> make login again to have the correct model

             }
             else{

               emit(RegisterSuccessState());
               Navigator.pop(context);
               authModel = r;

             }

           });
     }
     else{
       Navigator.pop(context);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("this phone number is exist")));
     }
    });
    // final response = await api.postRegister2(fullNameController.text, passwordController.text,phoneController.text,emailController.text);
    // response.fold(
    //         (l) {
    //       Navigator.pop(context);
    //       emit(RegisterFailureState());
    //
    //     },
    //         (r) {
    //       Navigator.pop(context);
    //       if(r.result==null){
    //         emit(RegisterFailureState());
    //         //todo -->handle emits because we have now only one mode auth model
    //         //todo--> make login again to have the correct model
    //
    //       }
    //       else{
    //
    //         emit(RegisterSuccessState());
    //         Navigator.pop(context);
    //         authModel = r;
    //
    //       }
    //
    //     });
  }

}
