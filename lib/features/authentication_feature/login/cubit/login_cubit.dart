import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kreez/core/models/login_error_model.dart';
import 'package:kreez/core/models/login_response_model.dart';
import 'package:kreez/core/remote/service.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/dialogs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  TextEditingController phoneOrMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ServiceApi api;
 late LoginResponseModel loginResponseModel ;
 late LoginErrorModel loginErrorModel ;

  login(BuildContext context) async {
    loadingDialog();
    final response = await api.postLogin(phoneOrMailController.text, passwordController.text);
    response.fold(
            (l) {
            Navigator.pop(context);
            emit(LoginFailureState());

            },
            (r) {
              Navigator.pop(context);
              if(r.result==null){
                emit(LoginFailureState());
                loginErrorModel = r as LoginErrorModel;
                emit(LoginFailureState());
              }
              else{
                emit(LoginSuccessState());
                loginResponseModel = r;

              }

            });
  }
}
